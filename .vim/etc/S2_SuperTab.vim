" SuperTab 设置
"set completeopt=longest,menu
"let g:SuperTabRetainCompletionType=2 
"let g:SuperTabDefaultCompletionType="<C-X><C-N>" 
""au FileType python let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
"let g:pcs_hotkey="<leader>pc"
au FileType ruby,eruby let g:SuperTabDefaultCompletionType="<C-X><C-U>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionType=1
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
