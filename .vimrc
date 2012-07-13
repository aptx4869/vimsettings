set nocompatible
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
so $VIMRUNTIME/vimrc_example.vim
set history=500
set nobackup

fu! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | en
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | en
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | en
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | en
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | en
    let eq = ''
    if $VIMRUNTIME =~ ' '
	if &sh =~ '\<cmd'
	    let cmd = '""' . $VIMRUNTIME . '\diff"'
	    let eq = '"'
	el
	    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	en
    el
	let cmd = $VIMRUNTIME . '\diff'
    en
    silent exec '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Set mapleader
let mapleader = ";"

" Platform
fu! MySys()
    if has("win32")
	return "windows"
    el
	return "linux"
    en
endf

fu! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
	exec bufwinnr . "wincmd w"
	return
    el
	" find in each tab
	tabfirst
	let tab = 1
	while tab <= tabpagenr("$")
	    let bufwinnr = bufwinnr(a:filename)
	    if bufwinnr != -1
		exec "normal " . tab . "gt"
		exec bufwinnr . "wincmd w"
		return
	    en
	    tabnext
	    let tab = tab + 1
	endwhile
	" not exist, new tab
	exec "tabnew " . a:filename
    en
endf

" 帮助文档
set helplang=cn

""""""""""""""template setting""""""""""""""""
let g:template_load = 1
let g:template_tags_replacing = 1
let g:T_AUTHOR = $USER
let g:T_AUTHOR_EMAIL = "ling548@gmail.com"
let g:template_path = $VIM . "/vimfiles/skel"
let g:template_prefix = "Template"
let g:T_AUTHOR_WEBSITE = "https://github.com/aptx4869"
nmap <leader>tp :call LoadTemplate()<Enter>
set scrolloff=3 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if MySys() == 'linux'
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :so ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    au! bufwritepost .vimrc so ~/.vimrc
    au FileType python nmap <F12> :!python %
    au FileType ruby nmap <F12> :!ruby %
    au FileType tex nmap <F12> :!pdflatex %
    set guifont=Arial\ monospaced\ for\ SAP\ 14
    "set gfw=Yahei\ Mono\ 29:cGB2312
    nmap <S-F2> :w !sudo tee %
    nmap [24~ :w !sudo tee %
    let g:template_path = $HOME . "/.vim/skel"
    "set notimeout          " 映射时不检查超时
    "set ttimeout           " 终端键码检查超时
    "set timeoutlen=500     " 超时为 100 毫秒
    hi StatusLine cterm=reverse ctermfg=4
    hi StatusLineNC cterm=underline,bold ctermfg=2
    hi CursorColumn cterm=NONE ctermbg=8
    hi CursorLine cterm=NONE ctermbg=8
    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    if match($TERM, "screen")!=-1
	set term=xterm
    en
    set t_Co=16
    "set ttimeoutlen=10
elseif MySys() == 'windows'
    set diffexpr=MyDiff()
    so $VIMRUNTIME/mswin.vim
    behave mswin
    " use C-A to add numbers
    nunmap <C-A>
    iunmap <C-Tab>
    " Disable alt menu
    set winaltkeys=no

    "Fast reloading of the _vimrc
    map <silent> <leader>ss :so $vim/_vimrc<cr>
    "Fast editing of _vimrc with different PC
    if hostname() == "BERT-PC"
	map <silent> <leader>ee :call SwitchToBuf("C:/Program Files (x86)/Vim/_vimrc")<cr>
    el
	map <silent> <leader>ee :call SwitchToBuf("c:/Program Files/Vim/_vimrc")<cr>
    en
    "When _vimrc is edited, reload it
    au! bufwritepost _vimrc so $vim/_vimrc

    au FileType python nmap <F12> :!python.exe %
    au FileType tex nmap <F12> :!pdflatex.exe %
    au FileType ruby nmap <F12> :!C:\RailsInstaller\Ruby1.9.3\bin\ruby.exe %
    au FileType autohotkey nmap <F12> :w<Enter><Esc>:mksession! lastsession.vim<Enter>
    "set pretty fonts for coding
    set guifont=Arial_monospaced_for_SAP:h14:cANSI
    set gfw=Yahei_Mono:h14:cGB2312

    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash
    set enc=chinese
en

" execute project related configuration in current directory
if filereadable("workspace.vim")
    so workspace.vim
en 

""""""""""""""""""""""""""""""
" Tag list (ctags)
" TagList 插件设置
""""""""""""""""""""""""""""""

if MySys() == "windows"                "设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"              "设定linux系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
en
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 20


let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"
"""""""""""for disable hight light""""""""""""

noremap <silent> <leader><space> :silent noh<CR> 

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


" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SuperTab 设置
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2 
let g:SuperTabDefaultCompletionType="<C-X><C-N>" 
"au FileType python let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
let g:pcs_hotkey="<leader>pc"

"-- omnicppcomplete setting --
"set completeopt=menu,menuone
"au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
au FileType ruby let g:SuperTabDefaultCompletionType="<C-X><C-U>" 

"let OmniC_MayCompleteDot = 1 " autocomplete with .
"let OmniC_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniC_ShowPrototypeInAbbr = 1 " show fu prototype  in popup window
"let OmniC_GlobalScopeSearch=1
"let OmniC_DisplayMode=1
"let OmniC_DefaultNamespaces=["std"]


" 代码折叠设置
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

set laststatus=2
"always display status line

set gdefault
"make s/ / act as s/ / /g

let g:EasyMotion_leader_key = "'"

"use <shif-tab> for xptemplate rather than <tab>
"because it confict with supertab 
let g:xptemplate_nav_next = '<S-Tab>'
let g:xptemplate_key = '<C-\>'

if MySys() == 'windows'
    au FileType python so $HOME/vimfiles/ftplugin/MyPython.vim
    au Filetype ruby so $HOME/vimfiles/ftplugin/ruby-macros.vim
    au FileType ruby so $HOME/vimfiles/ftplugin/MyRuby.vim
    au FileType autohotkey so $HOME/vimfiles/ftplugin/MyAutoHotKey.vim
    so $HOME/vimfiles/ftplugin/MyMisc.vim
    so $HOME/vimfiles/MyKeyMaps.vim
elseif MySys() == 'linux'
    au FileType python so $HOME/.vim/ftplugin/MyPython.vim
    au Filetype ruby so $HOME/.vim/ftplugin/ruby-macros.vim
    au FileType ruby so $HOME/.vim/ftplugin/MyRuby.vim
    au FileType autohotkey so $HOME/.vim/ftplugin/MyAutoHotKey.vim
    so $HOME/.vim/ftplugin/MyMisc.vim
    so $HOME/.vim/MyKeyMaps.vim
en

