set nocompatible
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()

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
au FileType ruby exec ":Rvm use"
au FileType ruby nno <buffer> <silent> <leader>db obinding.pry<ESC>
au FileType ruby nno <buffer> <silent> <leader>da ea.tap { \|x\| binding.pry}<ESC>
au FileType autohotkey exec ":so ".VimSetting_Path."/"."ftplugin/MyAutoHotKey.vim"
au FileType slim setlocal et sta sw=2 sts=2
au FileType ruby setlocal et sta sw=2 sts=2
au FileType css setlocal iskeyword+=-,$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 不知道哪来的
set tags+=gems.tags
set tags+=coffee.tags
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
"etc/S3_vim_rspec.vim
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
