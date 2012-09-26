" vim: set sw=4 sts=4 fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1 fdl=0:
nn <leader>gd :Gdiff<cr>
nn <leader>gs :Gstatus<cr>
nn <leader>gc :Gcommit<cr>
nn <leader>gw :Gwrite<cr>
nn <leader>gr :Gread<cr>
nn <leader>gm :Gmove <C-R>=expand('%:h').'/'<cr>
nn <leader>gb :Gblame<cr>
nn <leader>gl :Gbrows<cr>
nn <leader>gg :Git<space>
