
autocmd BufWrite * call s:autoFormatBeforSave()
autocmd FileType markdown let b:autoformat_autoindent=0


function s:autoFormatBeforSave()
	let whitelist = ['cpp', 'python']
	if index(whitelist, &ft) != -1
		execute "Autoformat"
	endif
endfunction
