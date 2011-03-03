set nocompatible "��ʹ�ü���ģʽ
autocmd! bufwritepost _vimrc source %

" map �ҵĳ��ð���
let mapleader=","
nmap <leader>u :BufExplorer<cr>
nmap <leader>p :NERDTreeToggle<cr>
" ��ʹ�� Dvorak ���̲��֣�����������ö�����˵�ܷ���
" �൱�� Qwerty �����ϰ� wf �� wr

map <C-S> <ESC>:w<CR>
imap <C-S> <ESC>:w<CR>
map <C-g> <ESC>
imap <C-g> <ESC>
map <F2> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>
"map <f3> :w\|!python %<cr>
"map <f4> :w\|!python -i %<cr>
"map <f3> :w\|!gcc-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f4> :w\|!gcc-3 -ggdb3 % && a.exe<cr>
"map <f5> :w\|!g++-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f6> :w\|!g++-3 -ggdb3 % && a.exe<cr>
map <F5> :VimwikiAll2HTML<CR><CR>
nmap <C-o> :e 

" ���³��� Leeiio ����������
nmap <C-Tab> <C-w><C-w>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap <C-t> :tabnew<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-q> ZZ



"set rnu "ʹ������к� (7.3)
set number "��ʾ�к�
set ruler "�����½���ʾ��ǰ���е���Ϣ
syntax enable "�﷨������ʾ
filetype indent on "�����ļ������Զ�����
filetype plugin on "�����ļ����ͼ��ز��

" ʹ�� 4 ���ո����������� Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set wrap "�Զ�����
"set linebreak "���в��ϴʣ���Ӣ���Ķ������Щ
set nolinebreak "����Ϊ����Ӧ���Ļ���
set backspace=start,indent,eol "�� Backspace ������ɾ������
set encoding=utf-8
"language message zh_CN.UTF-8
set langmenu=en_US.GBK
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set fileencodings=ucs-bom,utf-8,cp936,gbk "����֧��
set hidden "���л� buffer ���� undo ��¼
"set undofile "�����־û����� (7.3)
set viminfo='1000,f1,<500,%,h "�־ñ����ļ����λ�õ���Ϣ
set autochdir "�Զ���������Ŀ¼����ǰ�༭�ļ���Ŀ¼

"��������������ʽ���������Դ�Сд
set hlsearch
set incsearch
set ignorecase

set mouse=nv "�� Normal �� Visual ģʽ��ʹ�����

"���������С���
set cursorline
set cursorcolumn

set foldmethod=indent "�����Զ��۵���ʾ�ĵ�
set scrolloff=5 "������������С�����������ʱ�����¾���
set autoread "������ڱ༭���ļ��ڴ򿪺���������������£����Զ�����

"Emacs ʽ��ݼ�
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

" Leeiio ͯЬ�������������й���
" https://github.com/Leeiio/Vim/blob/master/vimrc

" ��ȡ��ǰĿ¼
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" ��ǩҳ
set tabpagemax=15 " ���15����ǩ
set showtabline=2 " ������ʾ��ǩ��

" �ر���������ʱ��������ʾ
set noerrorbells

" ��������״̬��
set cmdheight=1 " ���������еĸ߶�
set laststatus=2 " ʼ����ʾ״̬��
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "����״̬������Ϣ


"������ɫ����
"http://www.h3rald.com/articles/herald-vim-color-scheme/
colo herald

" ��װ�Ĳ����������

" JavaScript syntax
" http://www.vim.org/scripts/script.php?script_id=1491

" javaScriptLint.vim
" http://www.vim.org/scripts/script.php?script_id=2578

" VimBall ��װ����ر�
" http://www.vim.org/scripts/script.php?script_id=1502

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" delimitMate �Զ��������ŵ����
" http://www.vim.org/scripts/script.php?script_id=2754
let delimitMate_expand_space = 1 "����ڰ��ո���ڹ�����Ҿ�����ո�
let delimitMate_expand_cr = 1 "����ڰ��س����ѹ������м����
" �� html,yohtml �ļ��ڰٷֺ�Ҳ��Ϊ����Զ����룬���� jinja2 ģ�忪��
au FileType html,yohtml let b:delimitMate_quotes = "\" ' %"
" �޸� Emacs ʽ�༭��ݼ�
imap <C-A> <Plug>delimitMateHome
imap <C-E> <Plug>delimitMateEnd
imap <C-F> <Plug>delimitMateRight
imap <C-B> <Plug>delimitMateLeft

" VimWiki �Ǳʼ�
" http://www.vim.org/scripts/script.php?script_id=2226
let g:vimwiki_menu = ''
let g:vimwiki_badsyms = ' '
let g:vimwiki_browsers = ['firefox']
let wiki1 = {}
let wiki1.path = 'C:/Users/Yuest/My Dropbox/vimwiki/think'
let wiki2 = {}
let wiki2.path = 'C:/Users/Yuest/My Dropbox/vimwiki/note'
let wiki2.netest_syntaxes = {'py': 'python', 'js': 'javascript', 'html': 'html', 'css': 'css'}
let wiki2.auto_export = 1
let wiki2.html_header = 'C:/Users/Yuest/My Dropbox/vimwiki/note/header.tpl'
let wiki2.html_footer = 'C:/Users/Yuest/My Dropbox/vimwiki/note/footer.tpl'
let g:vimwiki_list = [wiki1, wiki2]

" BufExplorer �����л� Buffer
" http://www.vim.org/scripts/script.php?script_id=42
map <F9> :BufExplorer<CR>

" ZenCoding ����дHTML
" http://www.vim.org/scripts/script.php?script_id=2981
imap <C-A-E> <Plug>ZenCodingExpandNormal
vmap <C-A-E> <Plug>ZenCodingExpandVisual

" The NERD Tree ������ļ�
" http://www.vim.org/scripts/script.php?script_id=1658
map <F8> :NERDTreeToggle<CR>

