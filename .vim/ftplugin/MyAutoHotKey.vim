au BufNewFile,BufRead AutoHotkey.ahk nmap <F11> :!ctags -R ./AutoHotKey.ahk ./Lib/*.ahk
set foldmethod=indent
set omnifunc=ccomplete#Complete 
set path+=Lib
inoremap , ,<Space>
inoremap <C-Tab> <C-X><C-N>
let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
inoremap == <Space>==<Space>
inoremap := <Space>:=<Space>
inoremap != <Space>!=<Space>
inoremap += <Space>+=<Space>
inoremap -= <Space>-=<Space>
inoremap *= <Space>*=<Space>
inoremap /= <Space>/=<Space>
inoremap .= <Space>.=<Space>
inoremap ( ()<Left>
