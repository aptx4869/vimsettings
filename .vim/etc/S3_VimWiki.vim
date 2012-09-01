"mostly from https://github.com/yuest/vimsettings/blob/master/.vimrc 
let g:vimwiki_hl_headers=1
let g:vimwiki_folding=1
let g:vimwiki_CJK_length=1

let g:vimwiki_menu = ''
let g:vimwiki_badsyms = ' '
let g:vimwiki_browsers = ['firefox']
let wiki1 = {}

if MySys() == 'linux'
    let s:wiki_path = $HOME."/Dropbox/vimwiki"
elseif MySys() == 'windows'
    let s:wiki_path = "D:/My Documents/Dropbox/vimwiki"
en

let wiki1.path = s:wiki_path."/think"

let wiki1.nested_syntaxes = {'ruby':'ruby','py': 'python', 'js': 'javascript', 'html': 'html', 'css': 'css', 'bash': 'sh'}
"let wiki1.syntax = 'markdown'
let wiki2 = {}
let wiki2.path = s:wiki_path."/note"
"let wiki2.path = $HOME."/Dropbox/vimwiki/note"
let wiki2.nested_syntaxes = {'py': 'python', 'js': 'javascript', 'html': 'html', 'css': 'css', 'bash': 'sh'}
let wiki2.auto_export = 1
let wiki2.html_header = $HOME."/Dropbox/vimwiki/note/header.tpl"
let wiki2.html_footer = $HOME."/Dropbox/vimwiki/note/footer.tpl"
let g:vimwiki_list = [wiki1, wiki2]
"nm <silent> <leader>fe :Sexplore!<cr> 


"let g:vimwiki_diary_months = {
      "\ 1: 'Январь', 2: 'Февраль', 3: 'Март',
      "\ 4: 'Апрель', 5: 'Май', 6: 'Июнь',
      "\ 7: 'Июль', 8: 'Август', 9: 'Сентябрь',
      "\ 10: 'Октябрь', 11: 'Ноябрь', 12: 'Декабрь'
      "\ }

let g:vimwiki_diary_months = {
      \ 1: '一月', 2: '二月', 3: '三月',
      \ 4: '四月', 5: '五月', 6: '六月',
      \ 7: '七月', 8: '八月', 9: '九月',
      \ 10: '十月', 11: '十一月', 12: '十二月'
      \ }

au BufNewFile,BufRead *.wiki nmap <C-D> <Plug>VimwikiToggleListItem
au BufNewFile,BufRead *.wiki vmap <C-D> <Plug>VimwikiToggleListItem
au BufNewFile,BufRead *.wiki set sw=3
