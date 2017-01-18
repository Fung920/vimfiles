" ***This file is for VIM internal setting, no Plugins needed***{{{
" }}}

" ====[ showing invisible characters "tab" and "eol" ]===={{{
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list
set listchars=tab:▸\ ,eol:¬
" }}}

" ====[ do not compatible vi ]===={{{
set nocompatible
" }}}

" ====[ setting the default working directory ]===={{{
" exec 'cd ' . fnameescape('/vimdir')
" set autochdir
" }}}

" ====[ right under the screen will show the position ]===={{{
set ruler
" }}}

" ====[ syntax highlighting ]===={{{
syntax enable
syntax on
" }}}

" ====[ showing the status line(integrated with the airline) ]===={{{
set laststatus=2
" set statusline+=%F
" set statusline=%<%F\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
" highlight StatusLine term=bold,reverse cterm=bold,reverse
" }}}

" ====[ showing tab status ]===={{{
set showtabline=2
" }}}

" ====[ automatically reloading of vimrc file ]===={{{
autocmd! bufwritepost .vimrc source %
" }}}

" ====[ do not show the hightlight search result when re-open the file " ]===={{{
set nohls
" }}}

" ====[ smart search, case non-sensitive ]===={{{
set ignorecase smartcase
" }}}

" ====[ highlighting the match chars while searhing ]===={{{
set incsearch
" }}}

" ====[ for auto indentation ]===={{{
set shiftwidth=4
set autoindent
set smartindent
" }}}

" ====[ for map "tab" width ]===={{{
set ts=4
set expandtab
" }}}

" ====[ break the line instead of breaking the word ]===={{{
set linebreak
" }}}

" ====[ making backspace key works in the vim ]===={{{
set backspace=indent,eol,start
" }}}

" ====[ enable auto backup ]===={{{
set backup

if has("win32") || has("win64")
    let &backupdir = $HOME . "/vimfiles/.backup"
else
    let &backupdir = $HOME . "/.vim/.backup"
endif

if (filewritable(&backupdir) != 2)
    call mkdir(&backupdir, 'p')
endif
" }}}

" ====[ auto filetype detect ]===={{{
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" }}}

" ====[ disable .swap file ]===={{{
set noswapfile
" }}}

" ====[ showing the incomplete command in the status line ]===={{{
set showcmd
" }}}

" ====[ highlighting the cursor line(horizental) ]===={{{
set cursorline
" }}}

" ====[ UTF-8 support ]===={{{
set encoding=utf-8
" }}}

" ====[ mapping <F2> to paste toggle ]===={{{
set pastetoggle=<F2>
" }}}

" ====[ matching angle and brackets ]===={{{
set matchpairs+=<:>,«:»
" }}}

" ====[ Make Vim restore cursor position in files ]===={{{
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" }}}

" ====[ Adding the <c-x><c-k> dictionary ]===={{{
set dictionary+=/usr/share/dict/words
" }}}

" ====[ Folding the vimrc files]===={{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
