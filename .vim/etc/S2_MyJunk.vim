"au BufNewFile,BufRead bom*.csv :g/\v^[^"]*"[^"]*$/j
au BufNewFile,BufRead bom*.csv :/\v.*$\n(\d\.\d+.*$)+/,/\v,@<!(^\d\.\d+.*$\n)(\d[^.])@=/w %a
au BufNewFile,BufRead bom*.csv :g/^\v\d+\.\d/d
au BufNewFile,BufRead bom*.csv :%s/\v^.*(\d{10})/\1
au BufNewFile,BufRead bom*.csv :g/^\D/d
"au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10})((-\>.*,+)|(\s*".*))?$/\1
au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10}).*,(\d+(\.\d+)?),{4}$/\1,\2
au BufNewFile,BufRead bom*.csv :%s/\v^(\d{10},).*,(\d+((\.\d+)|(\s*\/\s*\d+))?).*$/\1\2
au BufNewFile,BufRead bom*.csv :%s/\v,+$//g
au BufNewFile,BufRead bom*.csv :%s/\//,,

au BufNewFile,BufRead bom*.csva :%s/\v^.*(\d{10})/\1
au BufNewFile,BufRead bom*.csva :1s/\v^.*(\d{10}).*/\1
"au BufNewFile,BufRead bom*.csva :%s/\v^(\d{10}).*,(\d+(\.\d+)?),{4}$/\1,\2
au BufNewFile,BufRead bom*.csva :%s/\v^(\d{10},).*,(\d+((\.\d+)|(\s*\/\s*\d+))?).*$/\1\2
au BufNewFile,BufRead *.reply set encoding=gbk
au BufNewFile,BufRead *.reply imap ( ( )<Left>
au BufNewFile,BufRead *.reply set fileencoding=utf-8
au BufNewFile,BufRead .pentadactylrc set foldmarker={,} foldlevel=0 filetype=vim
"au BufNewFile,BufRead *.reply nmap <F2> <Esc>GA<CR>才不用什么js脚本，这是vim签名档 <Esc>ZZ
"au BufNewFile,BufRead *.reply nmap <F3> :set encoding=utf-8
