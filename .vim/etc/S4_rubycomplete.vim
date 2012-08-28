let g:rubycomplete_load_on_global = 1
au BufNewFile,BufRead *spec.rb let g:rubycomplete_rails = 0
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1    
