let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exec 'so '.fnameescape(s:home).'/init.vim'
exec 'so '.fnameescape(s:home).'/wangzq.vim'

let g:bundle_group = ['simple', 'basic', 'atask', 'git', 'ycm', 'lightline', 'kitty']

exec 'so '.fnameescape(s:home).'/plug.vim'
