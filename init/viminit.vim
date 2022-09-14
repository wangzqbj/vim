set nocompatible

set backspace=eol,start,indent
set wildignore=*.swp,*.bak,*.pyc,*.obj,*.o,*.class
set ttimeout
set ttimeoutlen=50
set cmdheight=1
set ruler
set number
set nopaste
set display=lastline

set smartcase
set shiftwidth=8
set softtabstop=8
set noexpandtab
set tabstop=8
set wildmenu
set switchbuf=newtab
set incsearch
set hlsearch
set laststatus=2

if has('multi_byte')
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

set formatoptions+=m
set formatoptions+=B
set showcmd
set noshowmode

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"----------------------------------------------------------------------
" buffer keymap
"----------------------------------------------------------------------
noremap <silent>\bn :bn<cr>
noremap <silent>\bp :bp<cr>
noremap <silent>\bm :bm<cr>
noremap <silent>\bv :vs<cr>
noremap <silent>\bs :sp<cr>
noremap <silent>\bd :bdelete<cr>
noremap <silent>\bl :ls<cr>
noremap <silent>\bb :ls<cr>:b


"----------------------------------------------------------------------
" tab keymap
"----------------------------------------------------------------------
noremap <silent>\tc :tabnew<cr>
noremap <silent>\tq :tabclose<cr>
noremap <silent>\tn :tabnext<cr>
noremap <silent>\tp :tabprev<cr>
noremap <silent>\to :tabonly<cr>
noremap <silent>\th :-tabmove<cr>
noremap <silent>\tl :+tabmove<cr>
noremap <silent>\ta g<tab>
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
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

"----------------------------------------------------------------------
" miscs
"----------------------------------------------------------------------
set scrolloff=2
set showmatch
set matchtime=3
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" quit all
noremap <silent>Q :<c-u>confirm qall<cr>
