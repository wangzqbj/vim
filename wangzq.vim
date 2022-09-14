
if !empty($TMUX)
	set t_8f=[38;2;%lu;%lu;%lum
	set t_8b=[48;2;%lu;%lu;%lum
endif

if $TERM == "xterm-kitty"
	let &t_ut=''
endif

set bg=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <Leader>ps ?➜<cr>

runtime! ftplugin/man.vim

nnoremap <Leader>hl :<c-u>call matchadd('Search', '\%'.line('.').'l')<cr>
nnoremap <Leader>chl :<c-u>call clearmatches()<cr>

nnoremap - :call bufferhint#Popup()<cr>


vnoremap <C-y> "+y
nnoremap <C-p> "+p

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-d> <del>
