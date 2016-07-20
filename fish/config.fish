#!/bin/bash

#
# Make bash more friendly
#
shopt -s cdspell  # Correct directory names typo in cd commands
shopt -s nocaseglob  # Correct case errors in commands

#
# Export dotfiles bin directory
#
export PATH="${PATH}:~/dotfiles/bin"

#
# Python Developpement
#
export PYTHONPATH="{$PYTHONPATH}:~/dev/python"

#
# Arch-Linux specific
#
alias install="pacaur -Sy"
alias uninstall="sudo pacman -R"
alias update="sudo pacman -Syu"

#
# Extract script
#
# src: https://gist.github.com/Jaxmetalmax/f0ec6d2f86474d8d319b
extract () {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2) tar xjf $1 ;;
*.tar.gz) tar xzf $1 ;;
*.bz2) bunzip2 $1 ;;
*.rar) rar x $1 ;;
*.gz) gunzip $1 ;;
*.tar) tar xf $1 ;;
*.tbz2) tar xjf $1 ;;
*.tgz) tar xzf $1 ;;
*.zip) unzip $1 ;;
*.Z) uncompress $1 ;;
*) echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}

#
# Powerline Integration
#
source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

#
# Tmux configuration
#

# Load tmux by default
#[[ $TERM != "screen" ]] && exec tmux
