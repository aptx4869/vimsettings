"-- omnicppcomplete setting --
"set completeopt=menu,menuone
"au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
"au BufNewFile,BufRead *.scss setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1

"let OmniC_MayCompleteDot = 1 " autocomplete with .
"let OmniC_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniC_ShowPrototypeInAbbr = 1 " show fu prototype  in popup window
"let OmniC_GlobalScopeSearch=1
"let OmniC_DisplayMode=1
"let OmniC_DefaultNamespaces=["std"]
