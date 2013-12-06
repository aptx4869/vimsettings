"  vim: set ft=vim fdm=marker fdc=3 fdl=0:
"Set mapleader
let mapleader = ' '

"In fact we can call it anything
"map , <AwesomestLeaderEver>
"map <AwesomestLeaderEver>k :hello

"""""""""""for disable hight light""""""""""""
noremap <silent> <leader><space> :silent noh<CR>

" for angular.js injector's syntax
au FileType coffee nno <buffer><leader>p yyp:s/'//<cr>i(<esc>A)-><esc>:silent noh<CR>
au FileType coffee nno <buffer> <silent> <leader>db oconsole.log<space>

nno <C-@> <C-^>
nno $ `
nno <S-F12> :!rm %
nno <silent> <leader>fe :Sexplore!<cr>
vm  <silent> <leader>cf <Esc>`>o}}}<Esc><leader>cc`<O{{{<Esc><leader>cc^a<space>
nno <silent> <Tab> W
"nno <silent> <Tab> :set nohls nois lz<cr>/\v\S+<cr>:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <S-Tab> B
"nno <silent> <S-Tab> :set nohls nois lz<cr>?\v\S+<cr>:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <C-Tab> :set nohls nois lz<cr>/\v\S+<cr>n:set hls is<cr>:silent noh<CR>:set nolz<cr>
nno <silent> <C-S-Tab> :set nohls nois lz<cr>?\v\S+<cr>n:set hls is<cr>:silent noh<CR>:set nolz<cr>

" Move cursor by display lines when wrapping {{{
nno <Up>   gk
nno <Down> gj

ino <M-h> <Left>
ino <M-j> <Down>
ino <M-k> <Up>
ino <M-l> <Right>

ino <Left> <C-O>b
ino <Right> <C-O>w
ino <Up> <C-O>B
ino <Down> <C-O>W
ino <C-U> <C-G>u<C-U>
ino <C-Y> <C-O>p


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
ino <F2> <C-X><C-O>
ino <F3> <C-X><C-N>

vno <Tab> >gv
vno <S-Tab> <gv

cno $s submatch()<Left>
cno %% <C-R>=expand('%:h').'/'<cr>

"no <C-F> :find<space>

nno    <leader>a    "ayyj@a
nno    <leader>ss   :%!sort
vno   <leader>ss   :sort<cr>

" 一键看糗百
nno <leader>q :QB<CR>

" quick add utf8 file header
"nnoremap <buffer> <F1> :if strpart(getline(1),0,21) !='#!/usr/math/bin/ruby'<CR>0put ='#!/usr/math/bin/ruby'<CR>put =''<CR>endif<CR>:if getline(3) != ""<CR>1put =''<CR>endif<CR><Space>3Gi
"nno <leader>utf mlggO#-*-encoding:utf-8-*-<Esc>`l
nno <leader>u ml:if strpart(getline(1), 0, 21)  != '# encoding:utf-8'<CR>0put ='# encoding:utf-8'<CR>put =''<CR>endif<CR>:if getline(3)  !=  ""<CR>1put =''<CR>endif<CR><Space>`l

"html formatting
nno <leader>htm :%s#\v(\<[^</]*/[^</]*\>)#\1\r<Cr>:%s#\(<%\)#\r\1<Cr>:%s#\(%>\)#\1\r<Cr>gg=G:g/^\s*$/d<Cr>

"for zencoding
nm # v%<C-Y>,
" Tip: original & maps to repeat :s
" I feel its better,so comment out
"nm & v%

" Fn Keybings                                           {{{
" F1 for save                                           {{{
" quick save
nno <F1> :w<CR>
nno <M-F1> :w!<CR>
" quick save in insert mode
ino <F1> <Esc>:w<CR>a
ino <M-F1> <Esc>:w!<CR>a
"}}}
" F2 for open                                           {{{
nno  <F2>   :vsplit <C-R>=expand('%:h').'/'<cr>
"nno <F2>   :vsplit<space>
nno  <S-F2> :split <C-R>=expand('%:h').'/'<cr>
"nno <S-F2> :split<space>
nno  <M-F2> :tabedit <C-R>=expand('%:h').'/'<cr>
"}}}
" F3 for export                                         {{{
"nno <F3>   :g/^.*/pu_<CR>
nno <F3>   :'a,'bw <C-R>=expand('%:h').'/'<cr>
vno <F3>   :w <C-R>=expand('%:h').'/'<cr>
nno <S-F3> :'a,'bw >> <C-R>=expand('%:h').'/'<cr>
vno <S-F3> :w >> <C-R>=expand('%:h').'/'<cr>
nno <M-F3> :'a,'bw! >> <C-R>=expand('%:h').'/'<cr>
vno <M-F3> :w! >> <C-R>=expand('%:h').'/'<cr>
"}}}
" F4 for close                                          {{{
nno <F4>   :q<CR>
nno <S-F4> :q!<CR>
ino <F4>   <Esc>:q<CR>
ino <S-F4> <Esc>:q!<CR>
"}}}
" F5 for visual block edit                                    {{{
nno <F5>   gv
nno <S-F5> gvI
nno <M-F5> gvA
"}}}
" F6 for replace                                        {{{
" quick replace keyword, should search the target first
" use * is recommended
nno <F6> lbvey:%s/<C-R>//<C-R>0
""ToDo: find out why these don't work under terminal
nno <S-F6> lbvey:'a,'bs/<C-R>//<C-R>0
"}}}
" F7 for paste                                          {{{
"set pastetoggle=<F7>
"
function TogglePaste()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunc
nno <F7> :call TogglePaste()<cr>
nno <S-F7> "*p
"nm <S-F7> :set paste<CR>o<S-Insert>
""}}}
" F8 for browse                                         {{{
nno <F8> :TlistToggle<CR>
nno <S-F8> :NERDTreeToggle<CR>
"}}}
" F9 for formatting                                     {{{
nno <F9> mlgg=G`l:FixWhitespace
vno <F9> =gv
au FileType ruby nno <S-F9> :'a,'bs/\v:(\w+)\s+\=\>/\1:
"}}}

nno <F11> :!ctags -R --fields=+lS
au FileType ruby nno <F11> :!ctags -R --fields=+lS --exclude=.git --exclude=log * /home/aptx4869/.rvm/gems/ruby-1.9.3-p194/gems/*
nno <S-F11> :source lastsession.vim<CR>
nno <M-F11> :mksession lastsession.vim

"}}}
" quick delete a word
nno <BS> bdw
im <C-BS> <Esc>vbxa
"im  <Esc>vbxa

""ToDo: find out why these don't work under terminal
im <silent> <C-Del> wdw
im <silent> <C-Del> <esc>vexi

nno / /\v
cno %s %s/\v

nno ; :
nno : ;
nno \ :

map \ <M-\>
map ' <M-'>

ino \ <C-O>:
ino ' <C-O>:
vno <leader>y "+y
vno <C-C> "+y

no _ $
no - ^


"autocmd FileType gitcommit source .vim/bundle/vim-fugitive/plugin/fugitive.vim
"autocmd FileType gitcommit nnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line('.'),line('.')+v:count1-1)<CR>
"autocmd FileType gitcommit xnoremap <buffer> <silent> - :<C-U>execute <SID>StageToggle(line("'<"),line("'>"))<CR>

nno  <leader>dd :DiffOrig<cr>
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
