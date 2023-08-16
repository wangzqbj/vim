"----------------------------------------------------------------------
" miscs
"----------------------------------------------------------------------
set scrolloff=2
set showmatch
set matchtime=3
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

let g:netrw_browsex_viewer= "xdg-open"
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

runtime! ftplugin/man.vim
set keywordprg=:Man

nnoremap <Leader>hl :<c-u>call matchadd('Search', '\%'.line('.').'l')<cr>
nnoremap <Leader>chl :<c-u>call clearmatches()<cr>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

if has('patch-8.2.4500')
	set wildoptions+=pum,fuzzy
	set wildmode=longest,full
endif

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

"----------------------------------------------------------------------
" tab keymap
"----------------------------------------------------------------------
noremap <silent>\to :tabonly<cr>
noremap <silent>\tq :tabclose<cr>
noremap <silent>\1 :tabn 1<cr>
noremap <silent>\2 :tabn 2<cr>
noremap <silent>\3 :tabn 3<cr>
noremap <silent>\4 :tabn 4<cr>
noremap <silent>\5 :tabn 5<cr>
noremap <silent>\6 :tabn 6<cr>
noremap <silent>\7 :tabn 7<cr>
noremap <silent>\8 :tabn 8<cr>
noremap <silent>\9 :tabn 9<cr>
noremap <silent>\0 :tabn 10<cr>

" quit all
noremap <silent>Q :<c-u>confirm qall<cr>

function RandomColorScheme()
	let mypicks = ["gruvbox", "ayu", "molokai", "pyte"]
	let mypick = mypicks[ str2nr(strftime("%y%m%d"))  % len(mypicks)]
	"let mypick = mypicks[ localtime() % len(mypicks)]
	execute 'colo' mypick
endfunction

call RandomColorScheme()

