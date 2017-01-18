" ***Miscellaneous setting***{{{
" }}}

" ====[ Python PEP8 indention ]===={{{
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
" }}}

" ====[ Other file indention]===={{{
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2
" }}}

" ====[ Highlight excess line length in python ]===={{{
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python,*.py highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,*.py match Excess /\%81v.*/
    autocmd FileType python,*.py set nowrap
augroup END
" }}}

" ====[ omni autocompletion ]===={{{
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set omnifunc=syntaxcomplete#Complete
" }}}
