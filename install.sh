#!/bin/bash

# Configure bash
ln -s ~/dotfiles/bash/bashrc ~/.bashrc

# Configure zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# Configure fish
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

# Configure git
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore

# Configure tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Configure vim
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc

# Update git submodules
cd ~/dotfiles
git submodule update --init

cd ~/dotfiles/zsh/zsh-autosuggestions
git submodule update --init

cd ~/dotfiles/vim/bundle/YouCompleteMe
git submodule update --init --recursive

# Compile ycmd for usage with python (once)
cd ~/dotfiles/vim/bundle/YouCompleteMe
./install.py
