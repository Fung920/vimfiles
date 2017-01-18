" ====[ Vundle Plugin ]===={{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32") || has("win64")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
    call vundle#begin('$HOME/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" the plugins I'm using
Plugin 'othree/xml.vim'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'PProvost/vim-markdown-jekyll'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-liquid'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/vimtlib'
Plugin 'vim-syntastic/syntastic'                    " syntax checking
Plugin 'scrooloose/nerdtree'                        " files navigation
Plugin 'scrooloose/nerdcommenter'                   " fast comment
Plugin 'mattn/emmet-vim'                            " auto-complete for html tag
Plugin 'othree/html5.vim'                           " omnicomplete for html
Plugin 'ap/vim-css-color'                           " showing the css colors in the css files
Plugin 'Raimondi/delimitMate'                       " automatic closing of quotes, parenthesis, etc
Plugin 'vim-scripts/Pydiction'                      " python auto completion

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" ====[ modularize the vim configuration files ]===={{{
if has("win32") || has("win64")
    silent! source $HOME/vimfiles/dotfiles/setting.vim
    silent! source $HOME/vimfiles/dotfiles/shortcuts.vim
    silent! source $HOME/vimfiles/dotfiles/bundles.vim
    silent! source $HOME/vimfiles/dotfiles/colors.vim
    silent! source $HOME/vimfiles/dotfiles/functions.vim
    silent! source $HOME/vimfiles/dotfiles/misc.vim
    silent! source $HOME/vimfiles/dotfiles/gvim.vim
else
    silent! source $HOME/.vim/dotfiles/setting.vim
    silent! source $HOME/.vim/dotfiles/shortcuts.vim
    silent! source $HOME/.vim/dotfiles/bundles.vim
    silent! source $HOME/.vim/dotfiles/colors.vim
    silent! source $HOME/.vim/dotfiles/functions.vim
    silent! source $HOME/.vim/dotfiles/misc.vim
    silent! source $HOME/.vim/dotfiles/gvim.vim
endif
" }}}

