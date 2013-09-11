set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'drmingdrmer/xptemplate'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/vimwiki'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/xml.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/taglist.vim'
Bundle 'maksimr/vim-translator'
Bundle 'vim-scripts/fcitx.vim'
Bundle 'corntrace/bufexplorer'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/TeTrIs.vim'
Bundle 'vim-scripts/qiushibaike'
Bundle 'lilydjwg/colorizer'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ahao/vimcdoc'
Bundle 'vim-scripts/calendar.vim--Matsumoto'
Bundle 'vimcn/NERD_commenter.cnx'
Bundle 'vimcn/neocompletecache.cnx'
Bundle 'vimcn/vimwiki.vim.cnx'
Bundle 'vimcn/matchit.vim.cnx'
Bundle 'vimcn/NERD_tree.vim.cnx'
Bundle 'vim-ruby/vim-ruby'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/auto_mkdir'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/echofunc.vim'
Bundle 'sukima/xmledit'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'gvirus/YCommentReader'
Bundle 'tpope/vim-abolish'
Bundle 'vim-scripts/dbext.vim'
Bundle 'slim-template/vim-slim'
Bundle 'bogado/file-line'
Bundle 'tpope/vim-repeat'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-scripts/visSum.vim'
Bundle 'jgdavey/vim-blockle'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'junegunn/vim-easy-align'
Bundle 'bling/vim-airline'
Bundle 'gmarik/vundle'

so $VIMRUNTIME/vimrc_example.vim
set history=500
set nobackup
set autoread
set et sta sw=2 sts=2
set fcs=fold:\ ,vert:\|
set noeb vb t_vb=

" 帮助文档
set helplang=cn

filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
    let VimSetting_Path = $HOME."/"."vimfiles"
el
    let VimSetting_Path = $HOME."/".".vim"
en
let VimSetting_etc = VimSetting_Path . "/etc"
exec ":so ".VimSetting_Path."/"."Functions.vim"
au BufRead *vimrc exec ":set path+=".VimSetting_Path
au FileType python exec ":so ".VimSetting_Path."/"."ftplugin/MyPython.vim"
au FileType ruby exec ":so ".VimSetting_Path."/"."ftplugin/ruby-macros.vim"
au FileType ruby exec ":so ".VimSetting_Path."/"."ftplugin/MyRuby.vim"
au FileType ruby nno <buffer> <silent> <leader>db obinding.pry<ESC>
au FileType autohotkey exec ":so ".VimSetting_Path."/"."ftplugin/MyAutoHotKey.vim"
au FileType slim setlocal et sta sw=2 sts=2
au FileType ruby setlocal et sta sw=2 sts=2
au FileType css setlocal iskeyword+=-,$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 不知道哪来的
set tags+=tags;
set tags+=gems.tags
" 回行显示
set wrap
set nolinebreak
set textwidth=80

for ft in ['crontab','conf']
    exec "au FileType ".ft." set textwidth=255"
endfor

set formatoptions+=Mm
"set iskeyword+=<,>,(,),[,]

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

for i in range(10)
    let load_setting_name = "/S".i."*.vim"
    " plugin settings in .vim/etc should use a S[0-9] prefix as 'runlevel'
    for f in split(glob(VimSetting_etc.load_setting_name), '\n')
        exe 'source ' f
    endfor
endfor

"etc/Disable_javaScriptLint.vim
"etc/S1_Urxvt_fixbinding.vim
"etc/S1_EasyMotion.vim
"etc/S1_neo_com_setting.vim
"etc/S1_netrw.vim
"etc/S2_Ack_vim.vim
"etc/S2_Color_Solarized.vim
"etc/S2_Fugitive.vim
"etc/S2_google_tarnslator.vim
"etc/S2_Keybinds_Dvorak.vim
"etc/S2_LaTeX_Suit.vim
"etc/S2_MyJunk.vim
"etc/S2_omnicomplete.vim
"etc/S2_Pmenu_color.vim
"etc/S2_SuperTab.vim
"etc/S2_SystemDiff.vim
"etc/S2_TagList.vim
"etc/S2_template_loader.vim
"etc/S2_Tabulazire.vim
"etc/S2_vim-powerline.vim
"etc/S2_XPTemplate.vim
"etc/S3_VimWiki.vim
"etc/S3_Fugitive.vim
"etc/S3_vim_rails.vim
"etc/S4_rubycomplete.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal ctermfg=253
hi Comment ctermfg=248
set title  titlestring=%<%F%=%l/%L-%P titlelen=70

set showcmd " display incomplete commands

" execute project related configuration in current directory
if filereadable("workspace.vim")
    so workspace.vim
en

"autocmd InsertLeave * if &diff == 1 | diffupdate | endif
"set diffopt+=context:8
"set verbose=9   " for debug
"set wd=500
