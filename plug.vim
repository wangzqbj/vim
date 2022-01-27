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
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-commentary'
	Plug 'lilydjwg/fcitx.vim'
	Plug 'voldikss/vim-translator'
	IncScript site/translator.vim
endif

if has_key(s:enabled, 'basic')
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
	Plug 'vim-python/python-syntax', { 'for': ['python'] }
	Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
	Plug 'kergoth/vim-bitbake'
	Plug 'mfukar/robotframework-vim'
	Plug 'KabbAmine/zeavim.vim'
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'tamago324/LeaderF-filer'
	Plug 'vim-autoformat/vim-autoformat'

	IncScript site/syntax.vim
	IncScript site/leaderf.vim
	IncScript site/autoformat.vim
	IncScript site/zeal.vim
endif

if has_key(s:enabled, 'atask')
	Plug 'skywind3000/asynctasks.vim'
	Plug 'skywind3000/asyncrun.vim'
	let g:asyncrun_open = 25
	let g:asynctasks_rtp_config = "vim/tasks.ini"
endif

if has_key(s:enabled, 'git')
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'rhysd/git-messenger.vim'
	Plug 'mhinz/vim-signify'
endif

if has_key(s:enabled, 'lightline')
	Plug 'itchyny/lightline.vim'
	Plug 'shinchu/lightline-gruvbox.vim'
	IncScript site/lightline.vim
endif

if has_key(s:enabled, 'ycm')
	function! BuildYCM(info)
		if a:info.status == 'installed' || a:info.force
			!./install.py --clangd-completer
		endif
	endfunction

	Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

	IncScript site/ycm.vim
endif

call plug#end()
