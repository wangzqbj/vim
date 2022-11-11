"改变insert模式下的光标
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"

"
set termguicolors
set bg=dark

function RandomColorScheme()
	let mypicks = ["gruvbox", "ayu", "molokai", "iceberg", "pyte"]
	let mypick = mypicks[ str2nr(strftime("%y%m%d"))  % len(mypicks)]
	"let mypick = mypicks[ localtime() % len(mypicks)]
	execute 'colo' mypick
endfunction

call RandomColorScheme()
