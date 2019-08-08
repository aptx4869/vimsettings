if has("unix") && !has('gui_macvim')
    "set guifont=Liberation\ Mono\ 10
    "set guifontwide=WenQuanYi\ Zen\ Hei\ 10
endif
set linespace=3
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
" http://www.lesswatts.org/projects/powertop/known.php#gvim
let &guicursor = &guicursor . ",a:blinkon0"
set guioptions=aegimrLt
set background=light
