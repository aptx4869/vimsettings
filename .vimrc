
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
set history=500
set nobackup

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
	    let cmd = '""' . $VIMRUNTIME . '\diff"'
	    let eq = '"'
	else
	    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	endif
    else
	let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Set mapleader
let mapleader = ";"

" Platform
function! MySys()
    if has("win32")
	return "windows"
    else
	return "linux"
    endif
endfunction

function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
	exec bufwinnr . "wincmd w"
	return
    else
	" find in each tab
	tabfirst
	let tab = 1
	while tab <= tabpagenr("$")
	    let bufwinnr = bufwinnr(a:filename)
	    if bufwinnr != -1
		exec "normal " . tab . "gt"
		exec bufwinnr . "wincmd w"
		return
	    endif
	    tabnext
	    let tab = tab + 1
	endwhile
	" not exist, new tab
	exec "tabnew " . a:filename
    endif
endfunction

" For windows version
if MySys() == 'windows'
    source $VIMRUNTIME/mswin.vim
    behave mswin
    nunmap <C-A>
    iunmap <C-Tab>
endif 

"Fast edit vimrc
if MySys() == 'linux'
    " 帮助文档
    set helplang=cn
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    autocmd FileType python nmap <F12> :!python %
    autocmd FileType tex nmap <F12> :!pdflatex %
    set guifont=Arial\ monospaced\ for\ SAP\ 18
elseif MySys() == 'windows'
    " Disable alt menu
    set winaltkeys=no
    " Set helplang
    set helplang=cn
    "Fast reloading of the _vimrc
    map <silent> <leader>ss :source $vim/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>ee :call SwitchToBuf("c:/Program Files/Vim/_vimrc")<cr>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source $vim/_vimrc
    autocmd FileType python nmap <F12> :!python.exe %
    autocmd FileType tex nmap <F12> :!pdflatex.exe %
    au BufNewFile,BufRead AutoHotkey.ahk nmap <F12> :w<Enter><Esc>:mksession! lastsession.vim<Enter>
    set guifont=Arial_monospaced_for_SAP:h14:cANSI
    set gfw=Yahei_Mono:h14:cGB2312
    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash
    set enc=chinese
endif

" execute project related configuration in current directory
if filereadable("workspace.vim")
    source workspace.vim
endif 

"au BufNewFile,BufRead *.reply			setf reply
"autocmd FileType reply nmap <Esc>i签名档<Esc>ZZ

" This function is used for the 'omnifunc' option.

nmap <silent> <leader>fe :Sexplore!<cr> 

inoremap <M-h> <Left>
inoremap <M-j> <Down>
cnoremap <M-j> <Down>
inoremap <M-k> <Up>
cnoremap <M-k> <Up>
inoremap <M-l> <Right>

inoremap <SID>ou,. <Plug>IMAP_JumpForward
inoremap <C-B> <Esc>^i
inoremap <C-E> <Esc>$a
inoremap <F2> <Esc>:w<Enter>a
nmap <leader>a "ayy@a
nmap <leader>s :%!sort 
nmap <F2> :w<Enter>
nmap <F3> :g/^.*/pu_<Enter>
set pastetoggle=<F4>
nmap <F5> :q!<Enter>
nmap <f7> :'a,'bw! Lib/file
nmap <F8> :TlistToggle<Enter>
nmap <F11> :!ctags -R
nmap <C-BS> bdw
imap <C-BS> <Esc>vbxa
imap <C-Del> wdw
imap <C-Del> <esc>vexi

au BufNewFile,BufRead AutoHotkey.ahk nmap <F11> :!ctags -R ./AutoHotKey.ahk ./Lib/*.ahk
nmap <F6> bvey:%s<<C-R>0>/<C-R>0
nmap <S-F6> bvey:'a,'bs/\v<<C-R>0>/<C-R>0
nmap <C-F12> :mksession lastsession.vim
nmap <C-F11> :source lastsession.vim<Enter>
"set verbose=9
"i签名档<Esc>ZZ
nnoremap / /\v
cnoremap %s %s/\v
no s :
no S :
no - $
no _ ^
"no N <C-w><C-w>
"no T <C-w><C-r>
"no D <C-w><C-r>
""""""""""""""""""""""""""""""
" Tag list (ctags)
" TagList 插件设置
""""""""""""""""""""""""""""""

if MySys() == "windows"                "设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"              "设定linux系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 20


noremap <silent> <leader><space> :silent noh<CR> 
" Python 自动缩进统一使用空格
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python nmap <F12> :!python.exe %
autocmd FileType tex nmap <F12> :!pdflatex.exe %

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
autocmd FileType python let g:SuperTabDefaultCompletionType="<C-X><C-O>" 

au BufNewFile,BufRead *.ahk set omnifunc=ccomplete#Complete 
au BufNewFile,BufRead *.ahk set path+=Lib
au BufNewFile,BufRead *.ahk inoremap , ,<Space>
au BufNewFile,BufRead *.ahk inoremap <C-Tab> <C-X><C-N>
au BufNewFile,BufRead *.ahk let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
au BufNewFile,BufRead *.ahk inoremap == <Space>==<Space>
au BufNewFile,BufRead *.ahk inoremap := <Space>:=<Space>
au BufNewFile,BufRead *.ahk inoremap != <Space>!=<Space>
au BufNewFile,BufRead *.ahk inoremap += <Space>+=<Space>
au BufNewFile,BufRead *.ahk inoremap -= <Space>-=<Space>
au BufNewFile,BufRead *.ahk inoremap *= <Space>*=<Space>
au BufNewFile,BufRead *.ahk inoremap /= <Space>/=<Space>
au BufNewFile,BufRead *.ahk inoremap .= <Space>.=<Space>

au BufNewFile,BufRead bom*.csv :g/"/j
au BufNewFile,BufRead bom*.csv :%s/\v^.*(\d{10})/\1
au BufNewFile,BufRead bom*.csv :g/^\D/d
au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10})((-\>.*,+)|(\s*".*))?$/\1
au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10}).*,(\d+(\.\d+)?),{4}$/\1,\2
au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10},).*,(\d+((\.\d+)|(\s*\/\s*\d+))?).*$/\1\2

"-- omnicppcomplete setting --
"set completeopt=menu,menuone
"let OmniC_MayCompleteDot = 1 " autocomplete with .
"let OmniC_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniC_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
"let OmniC_GlobalScopeSearch=1
"let OmniC_DisplayMode=1
"let OmniC_DefaultNamespaces=["std"]


" 代码折叠设置
set foldmethod=syntax
au BufNewFile,BufRead *.ahk set foldmethod=indent
set foldlevel=100

set cin   
"实现C程序的缩进
set sw=4   
set number
set smartindent
behave xterm
set enc=chinese
au BufNewFile,BufRead *.reply set encoding=utf-8
au BufNewFile,BufRead *.reply set fileencoding=utf-8
au BufNewFile,BufRead *.reply nmap <F2> <Esc>GA<CR>才不用什么js脚本，这是vim签名档 <Esc>ZZ
"au BufNewFile,BufRead *.reply nmap <F3> :set encoding=utf-8
