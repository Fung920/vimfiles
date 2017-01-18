" ***This file is for plugins setting***{{{
" }}}

" ====[ mardown plugin  ]===={{{
let g:vim_markdown_frontmatter=1
" disable folding in markdown
let g:vim_markdown_folding_disabled = 1
autocmd BufNewFile,BufRead *.md set nofoldenable
autocmd BufNewFile,BufRead *.markdown set nofoldenable
" markdown languages support
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'python', 'ruby', 'sass', 'xml', 'bash',    'sql', 'perl']
" To fold in a style like python-mode, add the following to your
"" let g:vim_markdown_folding_style_pythonic = 1
" }}}

" ====[ airline plugin  ]===={{{
let g:airline_theme="luna"
" Airline TAB setting
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" ====[ Nerdtree plugin ]===={{{
"" autocmd vimenter * NERDTree
"" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>' :NERDTreeToggle<CR>
"" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" move to the first buffer
"" autocmd VimEnter * wincmd p
" }}}

" ====[ tabular plugin  ]===={{{
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" }}}

" ====[ nerdcommentary  ]===={{{
" Insert a space befor the comment
let g:NERDSpaceDelims=1
" }}}

" ====[ syntastic plugin ]===={{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1
" }}}

" ====[ emmet plugin ]===={{{
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default <C-Y> leader:
" let g:user_emmet_leader_key='<C-Z>'
" }}}

" ====[ css3-vim plugin ]===={{{
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
" }}}

" ====[ html5.vim plugin ]===={{{
" Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0
" Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0
" Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0
" Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0
" }}}

" ====[ delimitMate plugin ]===={{{
let delimiteMate_expand_cr = 2
" disable/enable delimitMate auto mapping
nnoremap <leader>d :DelimitMateSwitch<CR>
inoremap <leader>d <Esc>:DelimitMateSwitch<CR>a
" }}}

" ====[ Pydiction plugin ]===={{{
if filereadable($HOME."/.vim/bundle/Pydiction/complete-dict")
    let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
endif
" }}}
