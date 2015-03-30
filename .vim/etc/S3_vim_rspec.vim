" vim: set sw=4 sts=4 fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1 fdl=0:
" vim: set ft=vim fdm=marker fdc=3 fdl=0:
let g:rspec_command = "!BINDING_PRY=true bin/rspec {spec}"
au BufRead *spec.rb nno <M-F12> :call RunCurrentSpecFile()<CR>
au BufRead *spec.rb nno <Leader>s :call RunNearestSpec()<CR>
au BufRead *spec.rb nno <Leader>l :call RunLastSpec()<CR>
au BufRead *spec.rb nno <Leader>a :call RunAllSpecs()<CR>
