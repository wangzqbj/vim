
let g:formatters_json = ['fixjson']

function! s:EnableAuFormat()
	augroup auto_format
		autocmd BufWrite <buffer> :Autoformat
	augroup END
	let b:au_auto_format = 1
endfunction

function! s:DisableAuFormat()
	autocmd! auto_format
	let b:au_auto_format = 0
endfunction

function! s:ToggleAuFormat()
	if get(b:, 'au_auto_format')
		call s:DisableAuFormat()
	else
		call s:EnableAuFormat()
	endif
endfunction

autocmd FileType python,cpp,json call s:EnableAuFormat()
autocmd FileType gitcommit,markdown call s:EnableAuFormat()

noremap <Leader>af :<c-u>call <SID>ToggleAuFormat()<cr>
