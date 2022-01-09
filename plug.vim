let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")


if !exists('g:bundle_group')
	let g:bundle_group = []
endif

let g:bundle_enabled = {}
for key in g:bundle_group | let g:bundle_enabled[key] = 1 | endfor
let s:enabled = g:bundle_enabled


call plug#begin()

if has_key(s:enabled, 'simple')
	Plug 'easymotion/vim-easymotion'
	IncScript site/easymotion.vim
endif

call plug#end()
