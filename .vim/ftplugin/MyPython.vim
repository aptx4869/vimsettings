" Python 自动缩进统一使用空格
setlocal et sta sw=4 sts=4
"au! BufNewFile *.py silent! 0r $VIM/vimfiles/skel/Template.%:e
runtime! syntax/python.vim
unlet! b:current_syntax
syntax include @html syntax/html.vim
syntax match Character /%([a-zA-Z]\+)s/ contains=Todo
syntax region pythonCode start='"""\n\s*<[^<]\+>' keepend end='<[^<]\+>\s*\n"""' contains=@html
"syntax include @python syntax/python.vim
"syntax region pythonCode start="=\"\"\"" end="\"\"\"" contains=@html
syntax match Character '%(\w+)s' contains=Todo
"syntax region htmlCode start="=\"\"\"" end="\"\"\"" contains=@html


"ino = <Space>=<Space>
ino != <Space>!=<Space>
ino && <space>&&<space>
ino *= <Space>*=<Space>
ino += <Space>+=<Space>
ino , ,<Space>
ino -= <Space>-=<Space>
ino .= <Space>.=<Space>
ino /= <Space>/=<Space>
ino ;; <Esc>A:<Enter>
ino << <space><<<space>
ino <= <space><=<space>
ino <buffer> $f #--- P ----------------------------------------------<esc>FPxi
ino <buffer> $i import
ino <buffer> $p print
ino <buffer> $r return
ino <buffer> [ <C-R>=<SID>Double("[","]")<CR>
ino <buffer> { <C-R>=<SID>Double("{","}")<CR>
ino <buffer> ' <C-R>=<SID>Double("'","'")<CR>
ino <buffer> " <C-R>=<SID>Double('"','"')<CR>
ino == <Space>==<Space>
ino >= <space>>=<space>
ino >> <space>>><space>
map <buffer> <leader>1 /class
map <buffer> <leader>2 /def
map <buffer> <leader>C ?class
map <buffer> <leader>D ?def
function! s:Double(left,right)
    if strpart(getline(line(".")),col(".")-2,2) == a:left . a:right
	return "\<Del>"
    else
	return a:left . a:right . "\<Left>"
    endif
endfunction
