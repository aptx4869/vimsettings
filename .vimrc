set nocompatible
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
so $VIMRUNTIME/vimrc_example.vim
set history=500
set nobackup
set autoread

" 帮助文档
set helplang=cn

filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
    let VimSetting_Path = $HOME . "/vimfiles"
el
    let VimSetting_Path = $HOME . "/.vim"
en
let VimSetting_etc = VimSetting_Path . "/etc"
exec ":so " . VimSetting_Path . "/Functions.vim"

au FileType python exec ":so " . VimSetting_Path . "/ftplugin/MyPython.vim"
au FileType ruby exec ":so " . VimSetting_Path . "/ftplugin/ruby-macros.vim"
au FileType ruby exec ":so " . VimSetting_Path . "/ftplugin/MyRuby.vim"
au FileType autohotkey exec ":so " . VimSetting_Path . "/ftplugin/MyAutoHotKey.vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" execute project related configuration in current directory
if filereadable("workspace.vim")
    so workspace.vim
en

" 不知道哪来的
set tags+=tags;
" 回行显示
set wrap
set nolinebreak

""""""""""""""""""" Auto detect file encoding """""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
" 如果你要打开的文件编码不在此列，那就添加进去
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 代码折叠设置
"set foldenable
set foldmethod=syntax
set foldlevel=100

"实现C程序的缩进
set cin   
set sw=4
set number
set smartindent
behave xterm

"高亮所在行、列
set cursorline
set cursorcolumn
set scrolloff=3 

"always display status line
set laststatus=2

"make s/blabla/plapla act as s/blabla/plapla/g
set gdefault

if has('cmdline_info')
    set ruler " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd " show partial commands in status line and
    " selected characters/lines in visual mode
endif

"au FileType xhtml,xml,eruby ru ftplugin/html/autoclosetag.vim

""""""""""""""" Load plugin settings in .vim/etc """"""""""""""""""""

for i in split('1,2,3,4,5', ',')
    let load_setting_name = "/S" . i . "*.vim"
    " plugin settings in .vim/etc should use a S[1-5] prefix as 'runlevel'
    for f in split(glob(VimSetting_etc . load_setting_name), '\n')
	exe 'source ' f
    endfor
endfor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal ctermfg=253
hi Comment ctermfg=244
set showcmd		" display incomplete commands
"set verbose=9   " for debug
