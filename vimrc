let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exec 'so '.fnameescape(s:home).'/init.vim'
exec 'so '.fnameescape(s:home).'/plug.vim'

exec 'so '.fnameescape(s:home).'/wangzq.vim'

