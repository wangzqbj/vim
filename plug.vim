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
	Plug 'tpope/vim-eunuch'
	Plug 'voldikss/vim-translator'
	Plug 'christoomey/vim-system-copy'
	Plug 'skywind3000/vim-terminal-help'
	IncScript site/translator.vim
endif

if has_key(s:enabled, 'basic')
	Plug 'mhinz/vim-startify'
	Plug 'tomtom/tcomment_vim'
	Plug 'vim-python/python-syntax', { 'for': ['python'] }
	Plug 'pboettch/vim-cmake-syntax', { 'for': ['cmake'] }
	Plug 'kergoth/vim-bitbake'
	Plug 'mfukar/robotframework-vim'
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'tamago324/LeaderF-filer'
	Plug 'vim-autoformat/vim-autoformat'
	Plug 'jez/vim-superman'
	Plug 'itspriddle/vim-shellcheck'

	IncScript site/leaderf.vim
	IncScript site/autoformat.vim
	IncScript site/shellcheck.vim
endif

if has_key(s:enabled, 'atask')
	Plug 'skywind3000/asynctasks.vim'
	Plug 'skywind3000/asyncrun.vim'
	let g:asyncrun_open = 25
	let g:asynctasks_rtp_config = "vim/tasks.ini"
	let g:asynctasks_term_pos = 'TAB'
endif

if has_key(s:enabled, 'git')
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'rhysd/git-messenger.vim'
	Plug 'mhinz/vim-signify'
endif

if has_key(s:enabled, 'lightline')
	Plug 'itchyny/lightline.vim'
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

if has_key(s:enabled, 'kitty')
	Plug 'fladson/vim-kitty'
endif

if has_key(s:enabled, 'markdown')
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'vim-scripts/DrawIt'
	nmap <Leader>md <Plug>MarkdownPreviewToggle
endif

if has_key(s:enabled, 'fcitx')
	Plug 'lilydjwg/fcitx.vim'
endif

call plug#end()
