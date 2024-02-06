" copied from skywind


function! wzqlib#color_switch(names)
	if !exists('s:color_index')
		let s:color_index = 0
	endif
	if len(a:names) == 0
		return
	endif
	if s:color_index >= len(a:names)
		let s:color_index = 0
	endif
	let color = a:names[s:color_index]
	let s:color_index += 1
	exec 'color '.fnameescape(color)
	redraw! | echo "" | redraw!
	echo 'color '.color
endfunction
