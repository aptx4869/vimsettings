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
    set gfw=文泉驿等宽微米黑\ 14
    nmap <S-F2> :w !sudo tee %
    nmap [24~ :w !sudo tee %
    let g:template_path = $HOME . "/.vim/skel"
    set notimeout          " 映射时不检查超时
    set ttimeout           " 终端键码检查超时
    set timeoutlen=360     " 超时为 100 毫秒
    "set ttimeoutlen=10

    "hi Search ctermbg=12 ctermfg=6
    "set langmenu=zh_CN.UTF-8
    "source $VIMRUNTIME/delmenu.vim
    "source $VIMRUNTIME/menu.vim
    "language messages zh_CN.utf-8
    if match($TERM, "screen")!=-1
	set term=xterm
    en
    set t_Co=256
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

