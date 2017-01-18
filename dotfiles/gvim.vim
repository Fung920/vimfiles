" ***This file only for the gvim setting***{{{
" }}}

" ====[ Disable the gvim menu ]===={{{
set guioptions-=m
set guioptions-=T
silent! set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
set guioptions-=r
set guioptions-=L
if has('gui_running')
    set nolist
    set nornu
    if has("win32") || has("win64")
        au GUIEnter * simalt ~x
        " set guifont=Consolas:h14:b:cANSI
        silent! set guifont=Inconsolata:h14:cANSI
    endif
    let platform=system('uname')
    if (platform != 'Linux')
        set nolist
        set t_Co=256
    endif
endif
" }}}

