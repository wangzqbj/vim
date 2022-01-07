set nocompatible

set backspace=eol,start,indent
set autoindent
set cindent
set wildignore=*.swp,*.bak,*.pyc,*.obj,*.o,*.class
set ttimeout
set ttimeoutlen=50
set cmdheight=1
set ruler
set nopaste
set display=lastline

set shiftwidth=8
set softtabstop=8
set noexpandtab
set tabstop=8

if has('multi_byte')
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

set formatoptions+=m
set formatoptions+=B
set showcmd


"----------------------------------------------------------------------
" map CTRL_HJKL to move cursor in all mode
" config terminal bind <backspace> to ASCII code 127
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


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


"----------------------------------------------------------------------
" unimpaired
"----------------------------------------------------------------------
nnoremap <silent>[a :previous<cr>
nnoremap <silent>]a :next<cr>
nnoremap <silent>[A :first<cr>
nnoremap <silent>]A :last<cr>
nnoremap <silent>[b :bprevious<cr>
nnoremap <silent>]b :bnext<cr>
nnoremap <silent>[w :tabprevious<cr>
nnoremap <silent>]w :tabnext<cr>
nnoremap <silent>[W :tabfirst<cr>
nnoremap <silent>]W :tablast<cr>
nnoremap <silent>[q :cprevious<cr>
nnoremap <silent>]q :cnext<cr>
nnoremap <silent>[Q :cfirst<cr>
nnoremap <silent>]Q :clast<cr>
nnoremap <silent>[l :lprevious<cr>
nnoremap <silent>]l :lnext<cr>
nnoremap <silent>[L :lfirst<cr>
nnoremap <silent>]L :llast<cr>
nnoremap <silent>[t :tprevious<cr>
nnoremap <silent>]t :tnext<cr>
nnoremap <silent>[T :tfirst<cr>
nnoremap <silent>]T :tlast<cr>

" unimpaired options
nnoremap <silent>[oc :setl cursorline<cr>
nnoremap <silent>]oc :setl nocursorline<cr>
nnoremap <silent>[os :setl spell<cr>
nnoremap <silent>]os :setl nospell<cr>
nnoremap <silent>[op :setl paste<cr>
nnoremap <silent>]op :setl nopaste<cr>
nnoremap <silent>[ow :setl wrap<cr>
nnoremap <silent>]ow :setl nowrap<cr>
