" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termtrans=1    "default value is 0
let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_diffmode="high"    "default value is normal
"let g:solarized_hitrail=1    "default value is 0
"No need for this now.
"vim-trailing-whitespace already offer this feature
"and it can easily removes all trailing whitespaces use :FixWhitespace
if MySys() == 'windows' && has('gui')
    let g:solarized_italic=0   " italic font under windows looks ugly
en
set t_Co=256
"set background=light
if MySys() == 'linux'
    set background=dark
el
    set background=light
en
hi StatusLine cterm=reverse ctermfg=4
hi StatusLineNC cterm=underline,bold ctermfg=2
hi CursorColumn cterm=NONE ctermbg=8
hi CursorLine cterm=NONE ctermbg=8

"hi Normal ctermfg=253
"hi Comment ctermfg=244
"syntax enable
" already set in other place
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_menu=1
