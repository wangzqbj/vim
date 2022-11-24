"vim-bitbake
let g:bb_create_on_empty = 0

let b:autoformat_autoindent=0

function! s:append_path(root, meta)
	let classes = a:root . '/' . a:meta . '/classes'
	let conf = a:root . '/' . a:meta
	exec 'setlocal path+=' . classes
	exec 'setlocal path+=' . conf
endfunction

function! s:append_project_path()
	let root=fnamemodify(b:git_dir, ":h")
	let phosphor = finddir('meta-phosphor', root)
	let inspur = finddir('meta-inspur', root)
	if (phosphor == '') || (inspur == '')
		return
	endif
	let metas = [
				\ 'meta',
				\ 'meta-openembedded/meta-oe',
				\ 'meta-openembedded/meta-networking',
				\ 'meta-openembedded/meta-perl',
				\ 'meta-openembedded/meta-python',
				\ 'meta-openembedded/meta-webserver',
				\ 'meta-security',
				\ 'meta-phosphor',
				\ 'meta-aspeed',
				\ 'meta-inspur',
				\ 'meta-inspur/meta-x86',
				\ 'seta-inspur/meta-nf5280m7'
				\ ]
	for meta in metas
		call s:append_path(root, meta)
	endfor
endfunction

autocmd VimEnter * call s:append_project_path()

command! AppendPath call s:append_project_path()
