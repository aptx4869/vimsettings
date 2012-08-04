""""""""""""""template setting""""""""""""""""
let g:template_load = 1
let g:template_tags_replacing = 1
let g:T_AUTHOR = $USER
let g:T_AUTHOR_EMAIL = "ling548@gmail.com"
let g:template_path = VimSetting_Path . "/skel"
let g:template_prefix = "Template"
let g:T_AUTHOR_WEBSITE = "https://github.com/aptx4869"
let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"
nmap <leader>tp :call LoadTemplate()<Enter>
