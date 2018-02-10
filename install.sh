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

echo "prepare dein vim"
mkdir -p ~/.vim_runtime/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim_runtime/repos/github.com/Shougo/dein.vim
