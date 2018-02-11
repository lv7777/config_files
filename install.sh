#!/bin/sh

echo "copy .zshrc & .gitconfig"

cp ~/.zshrc ~/.zshrc.bak
rm ~/.zshrc
ln -s `pwd`/.zshrc ~/

cp ~/.gitconfig ~/.gitconfig.bak
rm ~/.gitconfig
ln -s `pwd`/.gitconfig ~/

cp ~/.vimrc ~/.vimrc.bak
rm ~/.vimrc
ln -s `pwd`/.vimrc ~/

#TODO
#mkdir -p ~/.config/fish/
#install oh-my-fish
#curl -L https://get.oh-my.fish | fish
#ln -s `pwd`/.config/fish/config.fish.zsh ~/.config/fish/config.fish

echo "prepare dein vim"
mkdir -p ~/.vim_runtime/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim_runtime/repos/github.com/Shougo/dein.vim
