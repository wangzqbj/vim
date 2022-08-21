let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")

call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'yianwillis/vimcdoc'
Plug 'voldikss/vim-translator'
IncScript site/translator.vim
Plug 'christoomey/vim-system-copy'
Plug 'skywind3000/vim-terminal-help'

Plug 'tomtom/tcomment_vim'
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
Plug 'kergoth/vim-bitbake'
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
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
IncScript site/lightline.vim

function! BuildYCM(info)
	if a:info.status == 'installed' || a:info.force
		!./install.py --clangd-completer
	endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
IncScript site/ycm.vim

Plug 'fladson/vim-kitty'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
nmap <Leader>md <Plug>MarkdownPreviewToggle

Plug 'vim-scripts/DrawIt'
Plug 'lilydjwg/fcitx.vim'

call plug#end()
