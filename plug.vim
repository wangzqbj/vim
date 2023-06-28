let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")

call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-vinegar'
Plug 'yianwillis/vimcdoc'
Plug 'voldikss/vim-translator'
IncScript site/translator.vim
Plug 'skywind3000/vim-terminal-help'

Plug 'tomtom/tcomment_vim'
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
Plug 'mfukar/robotframework-vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tamago324/LeaderF-filer'
IncScript site/leaderf.vim
Plug 'vim-autoformat/vim-autoformat'
IncScript site/autoformat.vim
Plug 'jez/vim-superman'
Plug 'itspriddle/vim-shellcheck'
IncScript site/shellcheck.vim

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 25
let g:asynctasks_rtp_config = "vim/tasks.ini"
let g:asynctasks_term_pos = 'TAB'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
IncScript site/lightline.vim

function! BuildYCM(info)
	if a:info.status == 'installed' || a:info.force
		!./install.py --clang-completer
	endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
IncScript site/ycm.vim

Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'

Plug 'fladson/vim-kitty'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
nmap <Leader>md <Plug>MarkdownPreviewToggle

Plug 'vim-scripts/DrawIt'
Plug 'lilydjwg/fcitx.vim'

Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'jceb/vim-textobj-uri'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
if v:version >= 900
	Plug 'Eliot00/git-lens.vim'
	nnoremap <Leader>gl :<c-u>call ToggleGitLens()<cr>
endif

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
IncScript site/hexokinase.vim

Plug 'rafi/awesome-vim-colorschemes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
IncScript site/easymotion.vim

call plug#end()
