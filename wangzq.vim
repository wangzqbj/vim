
if !empty($TMUX)
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
endif

if $TERM == "xterm-kitty"
    let &t_ut=''
endif

set bg=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
