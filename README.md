# Description

My cross platform vim setting, for RHEL, Ubuntu and Windows with msysgit installed.

# Usage

## Auto config(Recommended on Linux)
```bash
/bin/bash <(curl https://raw.githubusercontent.com/Fung920/vimfiles/master/vim.wrapper.sh)
```
## Manually config(Recommended on Windows)
### Linux
```bash
cd $HOME/.vim
git clone https://github.com/Fung920/vimfiles ~/.vim
cd ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/dotfiles/inputrc ~/.inputrc
ln -s ~/.vim/dotfiles/screenrc ~/.screenrc
cat >>~/.bashrc<<EOF

# from vim setting
. $HOME/.vim/dotfiles/bashrc
# end of vim setting

EOF
vim +PluginInstall +qall
#for solarized terminal theme(optional)
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git \
~/.vim/gnome-terminal-colors-solarized

~/.vim/gnome-terminal-colors-solarized/set_dark.sh
eval `dircolors ~/.dir_colors/dircolors`
rm -rf $HOME/.vim/gnome-terminal-colors-solarized
```

### Windows(with msysgit installed)
```bash
# In the git bash
git clone https://github.com/Fung920/vimfiles $HOME/vimfiles && cd $HOME/vimfiles
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/vimfiles/bundle/Vundle.vim
# Install the plugin inside the gvim
:PluginInstall

# In the git bash
ln -s $HOME/vimfiles/dotfiles/minttyrc ~/.minttyrc
ln -s $HOME/vimfiles/colors/dircolors.ansi-dark ~/.dircolors
# for vim in git bash
cp -rp $HOME/vimfiles ~/.vim
cat >>~/.bashrc<<EOF

# from vim setting
. $HOME/vimfiles/dotfiles/bashrc
# end of vim setting

EOF
```

# gitignore collection

[A collection of gitignore templates](https://github.com/github/gitignore)

# TMUX and screen cheat-sheet

Ctrl in tmux and screen will show as ^ here. My tmux prefix is ^a.

| Action                                                        | Tmux               | Screen                |
|---------------------------------------------------------------|--------------------|-----------------------|
| start a new session                                           | tmux or tmux new   | screen                |
| re-attach a detached session                                  | tmux a             | screen -r             |
| re-attach an attached session(detached it from else where)    | tmux a -d          | screen -dr            |
| re-attach an attached session(keeping it attached elsewhere)  | tmux a             | screen -x             |
| detach from current attached session                          | ^a d               | ^a d                  |
| rename window to a new name                                   | ^a ,               | ^a A                  |
| list windows                                                  | ^a w               | ^a w                  |
| list sessions                                                 | ^a s               | screen -ls            |
| go to  window number                                          | ^a window-number   | ^a window-number      |
| go to last active window                                      | ^a l               | ^a ^a                 |
| go to next window                                             | ^a n               | ^a n                  |
| go to previous window                                         | ^a p               | ^a p                  |
| seek key binding(searching for help)                          | ^a ?               | ^a ?                  |
| create another window                                         | ^a c               | ^a c                  |
| exit or logout current shell/window                           | ^d                 | ^d                    |
| split window horizontal                                       | ^a "               | ^a S                  |
| split window/pan vertical                                     | ^a %               | ^a pipe(vertical bar  |
| next pane                                                     | ^a o               | ^a (tab)              |
| previous pane                                                 | ^a ;               |                       |
| kill current pane                                             | logout OR ^a x     |                       |
| cycle location of panes                                       | ^a ^o              |                       |
| swap current pane with previous                               | ^a {               |                       |
| swap current pane with next                                   | ^a }               |                       |
| show time                                                     | ^a t               |                       |
| show numeric pane number                                      | ^a q               |                       |
| show numeric window number                                    | ^a w               |                       |
| change current pane to a new window                           | ^a !               |                       |
| kill current window                                           | ^a &               |                       |

License
================================
MIT

