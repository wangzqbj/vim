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
	Plug 'tpope/vim-eunuch'
endif

if has_key(s:enabled, 'basic')
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
	Plug 'vim-python/python-syntax', { 'for': ['python'] }
	Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
	Plug 'kergoth/vim-bitbake'
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'tamago324/LeaderF-filer'
	Plug 'vim-autoformat/vim-autoformat'

	IncScript site/syntax.vim
	IncScript site/leaderf.vim
	IncScript site/autoformat.vim
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
endif

if has_key(s:enabled, 'lightline')
	Plug 'itchyny/lightline.vim'
	IncScript site/lightline.vim
endif

if has_key(s:enabled, 'ycm')
	Plug 'ycm-core/YouCompleteMe'
	IncScript site/ycm.vim
endif

call plug#end()
