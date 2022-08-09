
let b:autoformat_autoindent=0
autocmd BufWrite * :Autoformat

"markdown
autocmd FileType markdown hi link markdownError NONE

setlocal dictionary+=~/.vim/vim/dict/word.dict
setlocal complete+=k
