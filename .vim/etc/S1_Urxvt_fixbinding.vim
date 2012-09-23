" vim: set sw=4 sts=4 fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1 fdl=0:

" F1-F12 {{{
set <F1>  =[11~
set <F2>  =[12~
set <F3>  =[13~
set <F4>  =[14~
set <F5>  =[15~
set <F6>  =[17~
set <F7>  =[18~
set <F8>  =[19~
set <F9>  =[20~
set <F10> =[21~
set <F11> =[23~
set <F12> =[24~
"}}}

for i in ["", "c", "i", "x"]
"Shift+F1-F12{{{
"" these should go into .Xresources {{{
    "URxvt*keysym.S-F1:  \033\[[23$
    "URxvt*keysym.S-F2:  \033\[[24$
    "URxvt*keysym.S-F3:  \033\[[11^
    "URxvt*keysym.S-F4:  \033\[[12^
    "URxvt*keysym.S-F5:  \033\[[13^
    "URxvt*keysym.S-F6:  \033\[[14^
    "URxvt*keysym.S-F7:  \033\[[15^
    "URxvt*keysym.S-F8:  \033\[[17^
    "URxvt*keysym.S-F9:  \033\[[18^
    "URxvt*keysym.S-F10: \033\[[19^
    "URxvt*keysym.S-F11: \033\[[20^
    "URxvt*keysym.S-F12: \033\[[21^
    ""}}}
    exe i . "map [[23$ <S-F1>"
    exe i . "map [[24$ <S-F2>"
    exe i . "map [[11^ <S-F3>"
    exe i . "map [[12^ <S-F4>"
    exe i . "map [[13^ <S-F5>"
    exe i . "map [[14^ <S-F6>"
    exe i . "map [[15^ <S-F7>"
    exe i . "map [[17^ <S-F8>"
    exe i . "map [[18^ <S-F9>"
    exe i . "map [[19^ <S-F10>"
    exe i . "map [[20^ <S-F11>"
    exe i . "map [[21^ <S-F12>"
"}}}
" Alt+ h j k l{{{
    exe i . "map h <M-h>"
    exe i . "map j <M-j>"
    exe i . "map k <M-k>"
    exe i . "map l <M-l>"
"}}}
endfor
