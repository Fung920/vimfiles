" ***This file contains some functions and their keystroke***{{{
" }}}

" ====[ relative number line toggle ]===={{{
set rnu
function! NumberToggle()
    if(&relativenumber == 1)
        set invnu nornu
    else
        set rnu
    endif
endfunc
nnoremap <C-n><C-n> :call NumberToggle()<CR>
nnoremap <leader>r :set nornu<CR>
" }}}

" ====[ Switch color theme between molokai and solarized ]===={{{
function! SwitchColor()
    if (g:colors_name == "solarized")
        " set background=dark
        colors molokai
    else
        if (g:colors_name == "molokai")
            " set background=light
            colors solarized
        endif
    endif
endfunction
nnoremap <leader>sc :call SwitchColor()<cr>
" }}}

" ====[ auto fix mis-spell by using \sp ]===={{{
set spell
" nnoremap <leader>sp :normal! mm[s1z=`m<cr>
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>
" }}}

" ====[ Vim sessions management function ]===={{{
" creates a session
function! MakeSession()
    if has("win32") || has("win64")
        let b:sessiondir = $HOME . "/vimfiles/.sessions"
    else
        let b:sessiondir = $HOME . "/.vim/.sessions"
    endif
    if (filewritable(b:sessiondir) != 2)
        " exe 'silent! mkdir -p ' b:sessiondir
        call mkdir(b:sessiondir, 'p')
        redraw!
    endif
    let b:sessionfile = b:sessiondir . '/session.vim'
    exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
    if has("win32") || has("win64")
        let b:sessiondir = $HOME . "/vimfiles/.sessions"
    else
        let b:sessiondir = $HOME . "/.vim/.sessions"
    endif
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe "mksession! " . b:sessionfile
        echo "updating session"
    endif
endfunction

" Load a session while initialize the vim
function! LoadSession()
    if argc() == 0
        if has("win32") || has("win64")
            let b:sessiondir = $HOME . "/vimfiles/.sessions"
        else
            let b:sessiondir = $HOME . "/.vim/.sessions"
        endif
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let b:sessionfile = ""
        let b:sessiondir = ""
    endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>
" }}}

" ====[ Insert file header in shell script and python ] ===={{{
autocmd BufNewFile *.sh,*.py,*.ksh exec ":call SetTitle()"
func! SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
        call append(line("."), "\#########################################################################")
        call append(line(".")+1, "\# File Name:     ".expand("%"))
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Mail:          kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# Description:   ")
        call append(line(".")+6, "\#                ")
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    endif
    if &filetype == 'ksh'
        call setline(1, "\#!/usr/bin/env ksh")
        call append(line("."), "\#########################################################################")
        call append(line(".")+1, "\# File Name:     ".expand("%"))
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Mail:          kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# Description:   ")
        call append(line(".")+6, "\#                ")
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "\#-*- encoding: utf-8 -*- ")
        call append(line(".")+1, "\"\"\"")
        call append(line(".")+2, "\# Author:        Fung Kong")
        call append(line(".")+3, "\# Email:         kyun.kong@gmail.com")
        call append(line(".")+4, "\# Created Time:  ".strftime('%Y-%m-%d %T', localtime()))
        call append(line(".")+5, "\# File Name:     ".expand("%"))
        call append(line(".")+6, "\# Description:   ")
        call append(line(".")+7, "\# ")
        call append(line(".")+8, "\"\"\"")
        call append(line(".")+9,"")
    endif
    " Replace by emmet-vim: insert mode, type "html:5" and type <c-y>, there's
    " a comma here
    normal G
endfunc
" }}}


