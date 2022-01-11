
autocmd BufWrite * call s:autoFormatBeforSave()

function s:autoFormatBeforSave()
	let whitelist = ['cpp', 'python']
	if index(whitelist, &ft) != -1
		execute "Autoformat"
	endif
endfunction
