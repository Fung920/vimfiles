" ***This file is for coloring setting***{{{
" }}}

" ====[ Showing EOL whitespace, MUST be inserted BEFORE the colorscheme command ]===={{{
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
"}}}

" ====[ color theme and terminal color ]===={{{
if $TERM == "xterm-256color"
    set t_Co=256
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
" }}}

" ====[ Highlighting current line ]===={{{
"" set cursorlin
"" hi CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"" set cursorcolumn
" Toggle cursor row highlighting on request...
"" highlight CursorLine term=bold ctermfg=black ctermbg=cyan cterm=bold
"" hi CursorLine   term=bold ctermbg=red ctermfg=white cterm=bold
"" hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" }}}

" ====[ solarized color theme and gui color setting ]===={{{
let g:solarized_termcolors=16
" gui theme & terminal themem
if has('gui_running')
    set background=dark
    silent! colorscheme molokai
else
    "autocmd BufEnter * color  wombat256mod
    "autocmd BufEnter *.md color peaksea
    "autocmd BufEnter *.markdown color peaksea
    set background=dark
    silent! colorscheme solarized
    " let g:molokai_original = 1
    " let g:rehash256 = 1
    " set background=dark
    " au FileType markdown colorscheme solarized
    " au FileType markdown set background=dark
    "au FileType *.md colorscheme peaksea
endif
" }}}

" ====[ Highlighting the comment line ]===={{{
highlight Comment term=bold,italic ctermfg=cyan gui=italic
" }}}

" ====[ Highlighting the Folded line ]===={{{
highlight Folded term=bold ctermfg=lightgrey ctermfg=red gui=bold guifg=grey guibg=black
" }}}

