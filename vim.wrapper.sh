#!/usr/bin/env bash
#------------------------------------------------------------------------
# File Name:     vim.wrapper.sh
# Author:        Fung Kong
# Mail:          kyun.kong@gmail.com
# Created Time:  2016-12-20 20:46:57
# Description:   This script is for synchronizing my VIM configuration with
#                my github repository, including installing to a new machine,
#                pulling/updating from the github, pushing the local
#                modifications to the git hub
# Platform:      Linux/Windows(with git installed)
#------------------------------------------------------------------------
timeStamp=$(date +%Y%m%d)
branch=master
platform=$(uname)
gitdir=~/.vim
dotfiledir=$gitdir/dotfiles
vimversion=$(vim --version | head -1 | cut -d ' ' -f 5)

# define the usage hint
# usage(){
    # echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # echo -e "+++Synchronize the vim configuration file with the github+++++++++++"
    # echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # echo -e "\n\toption 'Install' for newly installation;\n
    # \toption 'Pull' for pulling the github to the local repo;\n
    # \toption 'Push' for pushing the local repo to the github\n"
    # echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
# }

usage(){
    echo "========================================================================="
    echo -e "+\tSynchronize the vim configuration file with the github\t\t+"
    echo "========================================================================="
    echo -e "+\t\t\t\t\t\t\t\t\t+"
    echo -e "+\toption 'Install' for newly installation;\t\t\t+"
    # echo -e "+\t\t\t\t\t\t\t\t\t+"
    echo -e "+\toption 'Pull' for pulling the github to the local repo;\t\t+"
    # echo -e "+\t\t\t\t\t\t\t\t\t+"
    echo -e "+\toption 'Push' for pushing the local repo to the github\t\t+"
    echo -e "+\t\t\t\t\t\t\t\t\t+"
    echo "========================================================================="
}

# check the local git repository exists
dirstatus(){
    if [[ ! -d $gitdir ]]; then
        echo -e "+++Local git repository doesn't exist...\n"
        dirstat=0
    else
        dirstat=1
    fi
    return $dirstat
}

# check the git status
gitstatus(){
    if [[ -n "$(git status --porcelain)" ]]; then
        echo -e "+++Your local repo is not clean."
        gitstat=0
    else
        gitstat=1
    fi
    return $gitstat
}

# check the return code
rcstatus(){
    rc=$?
    if [ $rc -ne 0 ]; then
        echo -e "Something wrong with the previous command, please have a check...\n"
        exit -1
    fi
}

# for gnome-terminal solarized color/dircolors setting
colorized(){
    if [ $platform == 'Linux' ]; then
cat >>~/.wgetrc<<EOF
check_certificate=off
EOF
        echo -e '+++Setting up the gnome-terminal:\n
        +++git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git $gitdir/gnome-terminal-colors-solarized\n'
        git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git $gitdir/gnome-terminal-colors-solarized
        rcstatus

        echo -e "\n+++Setting up the solarized gnome-terminal color and dircolors."
        if [ -f ~/.dircolors ]; then
            echo -e '+++~/.dircolors exists, backup to ~/.dircolor.old'
            mv ~/.dircolors ~/.dircolors.old
        fi
        $gitdir/gnome-terminal-colors-solarized/set_dark.sh
        eval `dircolors ~/.dir_colors/dircolors`

        if [ -d $gitdir/gnome-terminal-colors-solarized ]; then
            echo -e "\n+++Removing the gnome-terminal-color folder..."
            rm -rf $gitdir/gnome-terminal-colors-solarized
        fi
    fi
}

# define the main function for the newly installation
INSTALL(){
    # backup is always essential
    dirstatus
    if [[ $dirstat == 1 ]]; then
        echo -e "+++Backing up the $gitdir dir...\nmv ${gitdir} ${gitdir}_old_$timeStamp"
        mv $gitdir ${gitdir}_old_$timeStamp
        echo -e "+++Backing up $gitdir folder done...\n"
    fi
    for file in ~/.vimrc ~/.inputrc ~/.screenrc
    do
        echo -e "+++Backing up $file...\nmv $file ${file}.${timeStamp}.bak"
        mv $file ${file}.${timeStamp}.bak >/dev/null 2>&1
        echo -e "+++Backup the $file end...\n"
    done

    #clone my vimrc repo
    echo -e 'Cloning vimfiles the github repository:
    +++git clone https://github.com/Fung920/vimfiles $gitdir\n'
    git clone https://github.com/Fung920/vimfiles $gitdir
    rcstatus

    echo -e '\n+++We need to install the vundle first:\n
    +++\tgit clone https://github.com/VundleVim/Vundle.vim.git $gitdir/bundle/Vundle.vim\n'
    git clone https://github.com/VundleVim/Vundle.vim.git $gitdir/bundle/Vundle.vim
    rcstatus

    echo -e '
    \n+++Creating the symbolic links for the rc files\n
    ln -s $gitdir/vimrc ~/.vimrc                #No need any more for vimversion >=7.4
    ln -s $dotfiledir/inputrc ~/.inputrc
    ln -s $dotfiledir/screenrc ~/.screenrc
    ln -s $dotfiledir/minittyrc ~/.minttyrc     #Only for windows
    '
    # if [ $(expr $vimversion \< 7.4) -eq 1 ]; then
    if [[ $vimversion < 7.4 ]]; then
        ln -s $gitdir/vimrc ~/.vimrc
    fi
    ln -s $dotfiledir/inputrc ~/.inputrc
    ln -s $dotfiledir/screenrc ~/.screenrc
    if [ $platform != 'Linux' ]; then
        ln -s $dotfiledir/minttyrc ~/.minttyrc
    fi
    echo -e '\n+++Adding source file to bashrc\n'
cat >>~/.bashrc<<EOF

# from vim setting
. $gitdir/dotfiles/bashrc
alias view='vi -R'
# end of vim setting

EOF
    echo -e "+++Install the vundle plugin...\n"
    vim +PluginInstall +qall
    sleep 3
    vim +PluginInstall +qall
    sleep 3
    vim +PluginInstall +qall
    sleep 3

    echo -e '+++Would you like to configure the solorized color theme for gnome-terminal?(y/n)'
    count=1
    while [ $count -le 3 ]
    do
        read -p ">" choice
        answer=$(echo $choice|tr 'a-z' 'A-Z')
        case $answer in
            Y)
                colorized
                break
                ;;
            N)
                echo -e "+++OK, the solarized color theme for gnome-terminal will not install..."
                break
                ;;
            *)  echo -e "+++Invalid option, please enter Y/y or N/n...\n"
                ;;
        esac
        count=$((count+1))
    done
    if [ $count -ge 4 ]; then
        echo -e "+++Too many error input attempt, terminating the script,please resolve the conflicts manual and run the script again...\n"
    fi

    if [ $(uname) != 'Linux' ]; then
        mkdir -p ~/vimfiles
        cp -r $gitdir/* ~/vimfiles
        if [ -f ~/.dircolors ]; then
            mv ~/.dircolors ~/.dircolors_$(timeStamp).bak
        fi
        ln -s $gitdir/colors/dircolors.ansi-dark ~/.dircolors
    fi
    echo -e "\n+++Installation done...\n"
}


UPDATE(){
    dirstatus
    if [[ $dirstat == 0 ]]; then
        exit 1
    else
        cd $gitdir
        gitstatus
        if [[ $gitstat == 0 ]]; then
            echo -e "+++Would you like to be overwritten by the remote repo?(Y/y or N/n)"
            count=1
            while [ $count -le 3 ]
            do
                read -p ">" choice
                answer=$(echo $choice|tr 'a-z' 'A-Z')
                case $answer in
                    Y)  git fetch --all
                        git reset --hard origin/$branch
                        git pull
                        break
                        ;;
                    N) echo -e "+++Please resolve the conflicts manual and run the script again...\n"
                        break
                        ;;
                    *) echo -e "+++Invalid option, please enter Y/y or N/n...\n"
                        ;;
                esac
                count=$((count+1))
            done
            if [ $count -ge 4 ]; then
                echo -e "+++Too many error input attempt, terminating the script,please resolve the conflicts manual and run the script again...\n"
            fi
        else
            echo -e "+++The local repo is clean, pull repo from remote to local is in action...\n"
            git pull origin $branch
        fi
    fi
}


PUSH(){
    dirstatus
    if [[ $dirstat == 0 ]]; then
        exit 1
    else
        cd $gitdir
        echo -e "+++Please enter a commit message here...\n"
        read -p ">" msg
        if [[ -z $msg ]]; then
            msg="make some modifications"
        fi
        git add . --all
        git commit -m "$msg"
        git push -u origin $branch
    fi
}


# clear the screen
clear

#Display the menu title header
echo -e "\n\t\t\tVIM configuration toolkit\n"
usage

# Defile the menu prompt
PS3="Select an option and press Enter:"

# The select command defines what the menu will look like
select opt in Install Pull Push Quit
do
    case $opt in
        Install) INSTALL
            break
            ;;
        Pull) UPDATE
            break
            ;;
        Push) PUSH
            break
            ;;
        Quit) break
            ;;
        *) echo "Invalid options"
            ;;
    esac
done
