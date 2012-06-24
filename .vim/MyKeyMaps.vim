nm <silent> <leader>fe :Sexplore!<cr> 
map<Up>   gk
map<Down> gj

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

"just get rid of this junk
ino <SID>ou,. <Plug>IMAP_JumpForward

ino <C-B> <Esc>^i
ino <C-E> <Esc>$a
ino <F2> <Esc>:w<CR>a
ino <S-CR> <Esc>o

cno $s submatch()<Left>
nm <leader>a "ayyj@a
nm <leader>s :%!sort 
nm <leader>q :QB<CR>
nm <F2> :w<CR>
nm <F3> :g/^.*/pu_<CR>
set pastetoggle=<F4>
nm <F5> :q!<CR>
nm <f7> :'a,'bw! Lib/file
nm <F8> :TlistToggle<CR>
nm <F11> :!ctags -R
nm <C-BS> bdw
im <C-BS> <Esc>vbxa
im <C-Del> wdw
im <C-Del> <esc>vexi

"nm <F6> bvey:%s<<C-R>0>/<C-R>0
no <F6> lbvey:%s/<C-R>//<C-R>0
no <S-F6> lbvey:'a,'bs/<C-R>//<C-R>0
nm <C-F12> :mksession lastsession.vim
nm <C-F11> :source lastsession.vim<CR>
"set verbose=9
nnoremap / /\v
cno %s %s/\v
no s :
no S :
no - $
no _ ^
"no N <C-w><C-w>
"no T <C-w><C-r>
"no D <C-w><C-r>
