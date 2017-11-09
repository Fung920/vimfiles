" ***This file is for keystroke of the vim ***{{{
" }}}

" ====[ mapping leader to comma ]===={{{
let mapleader = ","
" }}}

" ====[ Mapping <c-k> as D in insert mode ]===={{{
inoremap <C-k> <Esc>C
" }}}

" ====[ change what you just typed into uppercase ]===={{{
" Change a whole line into uppercase/lowercase: gUU/guu
inoremap <C-j> <esc>gUiwea
" }}}

" ====[ ignore case sensitive while searching ]===={{{
nnoremap / /\v
" }}}

" ====[ delete the space at the end of line in normal mode ]===={{{
nnoremap <leader><space> g_lD
" }}}}

" ====[ delete the space in the file ]===={{{
" nnoremap <leader>b :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>b :%s/\s\+$//g<CR>
" }}}

" ====[ bind Ctrl+<movement> keys to move around the windows ]===={{{
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" }}}

" ====[ map sort function to a key ]===={{{
vnoremap <leader>s :sort<CR>
" }}}

" ====[ mapping key for switch tab window ]===={{{
nnoremap <leader>bn :bnext!<CR>
nnoremap <leader>bp :bpre!<CR>
" }}}

" ===[ mapping force logout ]===={{{
nnoremap <leader>qa :qall!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>z :wq!<CR>
inoremap <leader>qa <Esc>:qall!<CR>
inoremap <leader>w <Esc>:w!<CR>
inoremap <leader>z <Esc>:wq!<CR>
" }}}

" ====[ while exiting vim, the file content still remain in the screen " ]===={{{
" set  t_ti= t_te=
" }}}

" ====[ mapping Esc key ]===={{{
inoremap jk <Esc>
" }}}

" ====[ reversing the virtual mode ]===={{{
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v
" }}}

" ====[ make BS/DEL work as expected in visual modes ]===={{{
vnoremap <BS> x
" }}}

" ====[ make vaa select the entire file ]===={{{
vnoremap aa VGo1G
" }}}

" ====[ use space to jump down a page (like browsers do) ]===={{{
nnoremap  <Space> <PageDown>
vnoremap  <Space> <PageDown>
" }}}

" ====[ fast copy to system clipboard ]===={{{
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
" }}}

" ====[ make ` execute the contents of the q register ]===={{{
nnoremap ` @q
vnoremap ` :normal @q<CR>
" }}}

" ====[ press F5 to run python/shell/perl script ]===={{{
" map <f5> :w<cr>:!python %<cr>
map <f5> :call RunScript()<cr>
func! RunScript()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'perl'
        exec "!perl %"
" }}}

" ====[ delete the ^M from windows(Not work on UNIX) ]===={{{
nnoremap mm :%s/\r//g<cr>
" }}}

