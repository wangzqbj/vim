

"copied from skywind3000, remove windows relative


"----------------------------------------------------------------------
" check absolute path name
"----------------------------------------------------------------------
function! wzqlib#path#isabs(path)
	let path = a:path
	if strpart(path, 0, 1) == '~'
		return 1
	endif
	let head = strpart(path, 0, 1)
	if head == '/'
		return 1
	endif
	return 0
endfunc


"----------------------------------------------------------------------
" join two path
"----------------------------------------------------------------------
function! wzqlib#path#join(home, name)
	let l:size = strlen(a:home)
	if l:size == 0 | return a:name | endif
	if wzqlib#path#isabs(a:name)
		return a:name
	endif
	let l:last = strpart(a:home, l:size - 1, 1)
	if l:last == "/"
		return a:home . a:name
	else
		return a:home . '/' . a:name
	endif
endfunc




"----------------------------------------------------------------------
" absolute path
"----------------------------------------------------------------------
function! wzqlib#path#abspath(path)
	let f = a:path
	if f =~ "'."
		try
			redir => m
			silent exe ':marks' f[1]
			redir END
			let f = split(split(m, '\n')[-1])[-1]
			let f = filereadable(f)? f : ''
		catch
			let f = '%'
		endtry
	endif
	if f == '%'
		let f = expand('%')
		if &bt == 'terminal'
			let f = ''
		elseif &bt == 'nofile'
			let is_directory = 0
			if f =~ '[\/\\]$'
				if f =~ '^[\/\\]' || f =~ '^.:[\/\\]'
					let is_directory = isdirectory(f)
				endif
			endif
			let f = (is_directory)? f : ''
		endif
	elseif f =~ '^\~[\/\\]'
		let f = expand(f)
	endif
	let f = fnamemodify(f, ':p')
	if f =~ '\/$'
		let f = fnamemodify(f, ':h')
	endif
	return f
endfunc


"----------------------------------------------------------------------
" dirname
"----------------------------------------------------------------------
function! wzqlib#path#dirname(path)
	return fnamemodify(a:path, ':h')
endfunc


"----------------------------------------------------------------------
" basename of /foo/bar is bar
"----------------------------------------------------------------------
function! wzqlib#path#basename(path)
	return fnamemodify(a:path, ':t')
endfunc

"----------------------------------------------------------------------
" find project root
"----------------------------------------------------------------------
function! s:find_root(path, markers, strict)
	function! s:guess_root(filename, markers)
		let fullname = wzqlib#path#abspath(a:filename)
		if fullname =~ '^fugitive:/'
			if exists('b:git_dir')
				return fnamemodify(b:git_dir, ':h')
			endif
			return '' " skip any fugitive buffers early
		endif
		let pivot = fullname
		if !isdirectory(pivot)
			let pivot = fnamemodify(pivot, ':h')
		endif
		while 1
			let prev = pivot
			for marker in a:markers
				let newname = wzqlib#path#join(pivot, marker)
				if newname =~ '[\*\?\[\]]'
					if glob(newname) != ''
						return pivot
					endif
				elseif filereadable(newname)
					return pivot
				elseif isdirectory(newname)
					return pivot
				endif
			endfor
			let pivot = fnamemodify(pivot, ':h')
			if pivot == prev
				break
			endif
		endwhile
		return ''
	endfunc
	if a:path == '%'
		if exists('b:asyncrun_root') && b:asyncrun_root != ''
			return b:asyncrun_root
		elseif exists('t:asyncrun_root') && t:asyncrun_root != ''
			return t:asyncrun_root
		elseif exists('g:asyncrun_root') && g:asyncrun_root != ''
			return g:asyncrun_root
		endif
	endif
	let root = s:guess_root(a:path, a:markers)
	if root != ''
		return wzqlib#path#abspath(root)
	elseif a:strict != 0
		return ''
	endif
	" Not found: return parent directory of current file / file itself.
	let fullname = wzqlib#path#abspath(a:path)
	if isdirectory(fullname)
		return fullname
	endif
	return wzqlib#path#abspath(fnamemodify(fullname, ':h'))
endfunc


"----------------------------------------------------------------------
" get project root
"----------------------------------------------------------------------
function! wzqlib#path#get_root(path, ...)
	let markers = ['.root', '.git', '.hg', '.svn', '.project']
	if exists('g:wzqlib_path_rootmarks')
		let markers = g:wzqlib_path_rootmarks
	endif
	if a:0 > 0
		if type(a:1) == type([])
			let markers = a:1
		endif
	endif
	let strict = (a:0 >= 2)? (a:2) : 0
	let l:hr = s:find_root(a:path, markers, strict)
	return l:hr
endfunc


" This one has neither {nosuf} nor {list}.
function! s:glob( ... )
	let l:nosuf = (a:0 > 1 && a:2)
	let l:list = (a:0 > 2 && a:3)
	if l:nosuf
		let l:save_wildignore = &wildignore
		set wildignore=
	endif
	try
		let l:result = call('glob', [a:1])
		return (l:list ? split(l:result, '\n') : l:result)
	finally
		if exists('l:save_wildignore')
			let &wildignore = l:save_wildignore
		endif
	endtry
endfunc
function! s:globpath( ... )
	let l:nosuf = (a:0 > 2 && a:3)
	let l:list = (a:0 > 3 && a:4)
	if l:nosuf
		let l:save_wildignore = &wildignore
		set wildignore=
	endif
	try
		let l:result = call('globpath', a:000[0:1])
		return (l:list ? split(l:result, '\n') : l:result)
	finally
		if exists('l:save_wildignore')
			let &wildignore = l:save_wildignore
		endif
	endtry
endfunc

function! wzqlib#path#glob(...)
	return call('s:glob', a:000)
endfunc

function! wzqlib#path#globpath(...)
	return call('s:globpath', a:000)
endfunc

"----------------------------------------------------------------------
" exists
"----------------------------------------------------------------------
function! wzqlib#path#exists(path)
	if isdirectory(a:path)
		return 1
	elseif filereadable(a:path)
		return 1
	else
		if !empty(wzqlib#path#glob(a:path, 1))
			return 1
		endif
	endif
	return 0
endfunc
