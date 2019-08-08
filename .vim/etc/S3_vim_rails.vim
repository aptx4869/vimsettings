" vim: set sw=4 sts=4 fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1 fdl=0:
" vim: set ft=vim fdm=marker fdc=3 fdl=0:

"if exists("b:rails_root")
    "nno <silent> <leader>rt :!touch Gemfile<CR>
"endif
autocmd User Rails nno <buffer> <silent> <leader>rt :!touch .rails_restart.log<CR>
autocmd User Rails nno <buffer> <silent> <leader>tr :!touch .reload_spork.log<CR>

