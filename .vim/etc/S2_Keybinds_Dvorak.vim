"  vim: set ft=vim fdm=marker fdc=3 fdl=0:
"Set mapleader
let mapleader = ";"

"in fact you can call it anything
"map , <AwesomestLeaderEver>
"map <AwesomestLeaderEver>k :hello

"""""""""""for disable hight light""""""""""""
noremap <silent> <leader><space> :silent noh<CR>


nno <silent> <leader>fe :Sexplore!<cr>
vm  <silent> <leader>cf <Esc>`>o}}}<Esc><leader>cc`<O{{{<Esc><leader>cc^a<space>
nno <silent> <Tab> :set nohls nois lz<cr>/\v\S+<cr>:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <S-Tab> :set nohls nois lz<cr>?\v\S+<cr>:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <C-Tab> :set nohls nois lz<cr>/\v\S+<cr>n:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <C-S-Tab> :set nohls nois lz<cr>?\v\S+<cr>n:set hls is<cr>:silent noh<CR>:set nolz<cr>

" Move cursor by display lines when wrapping {{{
map <Up>   gk
map <Down> gj

ino <M-h> <Left>
ino <M-j> <Down>
ino <M-k> <Up>
ino <M-l> <Right>

"cno <M-h> <Left>
"cno <M-j> <Down>
"cno <M-k> <Up>
"cno <M-l> <Right>
"}}}

" Quick switch pane {{{
nno <C-h> <C-W>h
nno <C-j> <C-W>j
nno <C-k> <C-W>k
nno <C-l> <C-W>l
"}}}

"just get rid of this junk of vim-latex
"ino <SID>ou,. <Plug>IMAP_JumpForward

" Emacs Like Insert Mode Keybings{{{
" Insert &Befor current line in insert mode
ino <C-B> <Esc>^i
" Append at the &End of current line in insert mode
ino <C-E> <Esc>$a
" add a new line in insert mode
ino <S-CR> <Esc>o
ino <C-O> <Esc>o
"}}}

" for omnicomplete
ino <F1> <C-X><C-O>
ino <F3> <C-X><C-N>

vno <Tab> >gv
vno <S-Tab> <gv

cno $s submatch()<Left>
cno %% <C-R>=expand('%:h').'/'<cr>

"no <C-F> :find<space>

nm <leader>a "ayyj@a
nm <leader>s :%!sort
" 一键看糗百
nm <leader>q :QB<CR>

" quick add utf8 file header
"nm <leader>utf mlggO#-*-encoding:utf-8-*-<Esc>`l
nm <leader>u ml:if strpart(getline(1), 0, 21)  != '#-*-encoding:utf-8-*-'<CR>0put ='#-*-encoding:utf-8-*-'<CR>put =''<CR>endif<CR>:if getline(3)  !=  ""<CR>1put =''<CR>endif<CR><Space>`l

"html formatting
nno <leader>htm :%s#\v(\<[^</]*/[^</]*\>)#\1\r<Cr>:%s#\(<%\)#\r\1<Cr>:%s#\(%>\)#\1\r<Cr>gg=G:g/^\s*$/d<Cr>

"for zencoding
nm # v%<C-Y>,
nm & v%

" quick save

nno <F2> :w<CR>

" quick save in insert mode
ino <F2> <Esc>:w<CR>a
"nm <F3> :g/^.*/pu_<CR>
set pastetoggle=<F4>
nm <F5> :q!<CR>

" quick replace keyword, should search the target first
" use * is recommended
nno <F6> lbvey:%s/<C-R>//<C-R>0
""ToDo: find out why these don't work under terminal
nno <S-F6> lbvey:'a,'bs/<C-R>//<C-R>0

nm <F7> :'a,'bw! Lib/file
nm <S-F7> :'a,'bs/\v:(\w+) \=\>/\1:
nm <F8> :TlistToggle<CR>
nm <S-F8> :NERDTreeToggle<CR>
"for linux term
nm <F11> :!ctags -R --fields=+lS

au FileType ruby nm <F11> :!ctags -R --fields=+lS --exclude=.git --exclude=log * /home/aptx4869/.rvm/gems/ruby-1.9.3-p194/gems/*

nm <C-F11> :source lastsession.vim<CR>
nm <C-F12> :mksession lastsession.vim

" quick delete a word
nm <BS> bdw
im <C-BS> <Esc>vbxa
im  <Esc>vbxa

""ToDo: find out why these don't work under terminal
im <C-Del> wdw
im <C-Del> <esc>vexi

nnoremap / /\v
cno %s %s/\v
no \ :
vno <leader>y "+y
vno <C-C> "+y
"no S :
autocmd FileType gitcommit let b:git='true'
if !exists("b:git")
    no _ $
    no - ^
else
    "source .vim/bundle/vim-fugitive/plugin/fugitive.vim
    "nnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line('.'),line('.')+v:count1-1)<CR>
    "xnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line("'<"),line("'>"))<CR>
endif

"autocmd FileType gitcommit source .vim/bundle/vim-fugitive/plugin/fugitive.vim
"autocmd FileType gitcommit nnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line('.'),line('.')+v:count1-1)<CR>
"autocmd FileType gitcommit xnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line("'<"),line("'>"))<CR>



nno  <leader>dG :diffget\|diffupdate<CR>
vno <leader>dG :diffget\|diffupdate<CR>
nno  <leader>dg :diffget<space>\|diffupdate<left><left><left><left><left><left><left><left><left><left><left>
vno <leader>dg :diffget<space>\|diffupdate<left><left><left><left><left><left><left><left><left><left><left>
nno  <leader>dP :diffput\|diffupdate<CR>
vno <leader>dP :diffput\|diffupdate<CR>
nno  <leader>dp :diffput<space>\|diffupdate<left><left><left><left><left><left><left><left><left><left><left>
vno <leader>dp :diffput<space>\|diffupdate<left><left><left><left><left><left><left><left><left><left><left>
nno  <leader>du :diffupdate<CR>

"no N <C-w><C-w>
"no T <C-w><C-r>
"no D <C-w><C-r>
