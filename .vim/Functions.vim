fu! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | en
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | en
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | en
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | en
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | en
    let eq = ''
    if $VIMRUNTIME =~ ' '
	if &sh =~ '\<cmd'
	    let cmd = '""' . $VIMRUNTIME . '\diff"'
	    let eq = '"'
	el
	    let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	en
    el
	let cmd = $VIMRUNTIME . '\diff'
    en
    silent exec '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" Platform
fu! MySys()
    if has("win32")
	return "windows"
    el
	return "linux"
    en
endf

fu! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
	exec bufwinnr . "wincmd w"
	return
    el
	" find in each tab
	tabfirst
	let tab = 1
	while tab <= tabpagenr("$")
	    let bufwinnr = bufwinnr(a:filename)
	    if bufwinnr != -1
		exec "normal " . tab . "gt"
		exec bufwinnr . "wincmd w"
		return
	    en
	    tabnext
	    let tab = tab + 1
	endwhile
	" not exist, new tab
	exec "tabnew " . a:filename
    en
endf
