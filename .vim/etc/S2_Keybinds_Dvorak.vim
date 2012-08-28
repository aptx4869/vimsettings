"Set mapleader
let mapleader = ";"

map , <AwesomestLeaderEver>
map <AwesomestLeaderEver>k :hello

"""""""""""for disable hight light""""""""""""
noremap <silent> <leader><space> :silent noh<CR>

nm <silent> <leader>fe :Sexplore!<cr> 

map <Up>   gk
map <Down> gj

no! <M-h> <Left>
no! <M-j> <Down>
no! <M-k> <Up>
no! <M-l> <Right>

no! h <Left>
no! j <Down>
no! k <Up>
no! l <Right>

"cno <M-h> <Left>
"cno <M-j> <Down>
"cno <M-k> <Up>
"cno <M-l> <Right>

"just get rid of this junk of vim-latex
"ino <SID>ou,. <Plug>IMAP_JumpForward

" Insert Befor current line in insert mode
ino <C-B> <Esc>^i
" Append at the End of current line in insert mode
ino <C-E> <Esc>$a
" add a new line in insert mode 
ino <S-CR> <Esc>o
ino <C-O> <Esc>o

" for omnicomplete
ino <F1> <C-X><C-O>
ino <F3> <C-X><C-N>

cno $s submatch()<Left>

"no <C-F> :find<space>

nm <leader>a "ayyj@a
nm <leader>s :%!sort 
" 一键看糗百
nm <leader>q :QB<CR>
" quick add utf8 file header
"nm <leader>utf mlggO#-*-encoding:utf-8-*-<Esc>`l
nm <leader>utf ml:if strpart(getline(1), 0, 21)  != '#-*-encoding:utf-8-*-'<CR>0put ='#-*-encoding:utf-8-*-'<CR>put =''<CR>endif<CR>:if getline(3)  !=  ""<CR>1put =''<CR>endif<CR><Space>`l

"html formatting
no <leader>htm :%s#\v(\<[^</]*/[^</]*\>)#\1\r<Cr>:%s#\(<%\)#\r\1<Cr>:%s#\(%>\)#\1\r<Cr>gg=G:g/^\s*$/d<Cr>

"for zencoding
nm <leader>5 v%<C-Y>,

" quick save
nm <F2> :w<CR>
" quick save in insert mode
ino <F2> <Esc>:w<CR>a
"nm <F3> :g/^.*/pu_<CR>
set pastetoggle=<F4>
nm <F5> :q!<CR>

" quick replace keyword, should search the target first
" use * is recommended
no <F6> lbvey:%s/<C-R>//<C-R>0
""ToDo: find out why these don't work under terminal
no <S-F6> lbvey:'a,'bs/<C-R>//<C-R>0
no [29~ lbvey:'a,'bs/<C-R>//<C-R>0

nm <F7> :'a,'bw! Lib/file
nm <S-F7> :'a,'bs/\v:(\w+) \=\>/\1:
nm [31~ :'a,'bs/\v:(\w+) \=\>/\1:
nm <F8> :TlistToggle<CR>
nm <S-F8> :NERDTreeToggle<CR>
"for linux term
nm [32~ :NERDTreeToggle<CR>
nm <F11> :!ctags -R
au FileType ruby nm <F11> :!ctags -R --exclude=.git --exclude=log * /home/aptx4869/.rvm/gems/ruby-1.9.3-p194/gems/*
nm <C-F11> :source lastsession.vim<CR>
nm <C-F12> :mksession lastsession.vim

" quick delete a word
nm <C-BS> bdw
nm  bdw
im <C-BS> <Esc>vbxa
im  <Esc>vbxa

""ToDo: find out why these don't work under terminal
im <C-Del> wdw
im <C-Del> <esc>vexi

nnoremap / /\v
cno %s %s/\v
no \ :
no <leader>y "+y
"no S :
no _ $
no - ^
"no N <C-w><C-w>
"no T <C-w><C-r>
"no D <C-w><C-r>
