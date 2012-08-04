set nocompatible
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
so $VIMRUNTIME/vimrc_example.vim
set history=500
set nobackup

" 帮助文档
set helplang=cn

filetype plugin on
filetype indent on

if has("win32")
    let VimSetting_Path = $HOME . "/vimfiles"
el
    let VimSetting_Path = $HOME . "/.vim"
en

let VimSetting_etc = VimSetting_Path . "/etc"

exec ":so " . VimSetting_Path . "/Functions.vim"

set scrolloff=3 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 不知道哪来的
set is
set tags+=tags;
set wrap
set nolinebreak
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 " 如果你要打开的文件编码不在此列，那就添加进去
set fileencoding=utf-8
set termencoding=utf-8
set autoread

" 代码折叠设置
"set foldenable
set foldmethod=syntax
set foldlevel=100

set cin   
"实现C程序的缩进
set sw=4
set number
set smartindent
behave xterm

"高亮所在行、列
set cursorline
set cursorcolumn

"always display status line
set laststatus=2

"make s/ / act as s/ / /g
set gdefault

let g:EasyMotion_leader_key = "'"

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 20



if MySys() == 'windows'
    au FileType python so $HOME/vimfiles/ftplugin/MyPython.vim
    au FileType ruby so $HOME/vimfiles/ftplugin/ruby-macros.vim
    au FileType ruby so $HOME/vimfiles/ftplugin/MyRuby.vim
    au FileType autohotkey so $HOME/vimfiles/ftplugin/MyAutoHotKey.vim
    so $HOME/vimfiles/neo_com_setting.vim
elseif MySys() == 'linux'
    au FileType python so $HOME/.vim/ftplugin/MyPython.vim
    au FileType ruby so $HOME/.vim/ftplugin/ruby-macros.vim
    au FileType ruby so $HOME/.vim/ftplugin/MyRuby.vim
    au FileType autohotkey so $HOME/.vim/ftplugin/MyAutoHotKey.vim
    so $HOME/.vim/neo_com_setting.vim
    "so $HOME/.vim/MyKeyMaps.vim
en

" execute project related configuration in current directory
if filereadable("workspace.vim")
    so workspace.vim
en

if has('cmdline_info')
    set ruler " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd " show partial commands in status line and
    " selected characters/lines in visual mode
endif

au FileType xhtml,xml,eruby ru ftplugin/html/autoclosetag.vim

"hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
"hi PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

for f in split(glob(VimSetting_etc . "/*.vim"), '\n')
    exe 'source ' f
endfor
