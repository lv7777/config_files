#!/bin/sh

echo "copy .zshrc & .gitconfig"

cp ~/.zshrc ~/.zshrc.bak
rm ~/.zshrc
ln -s ./.zshrc ~/

cp ~/.gitconfig ~/.gitconfig.bak
rm ~/.gitconfig
ln -s ./.gitconfig ~/

cp ~/.vimrc ~/.vimrc.bak
rm ~/.vimrc
ln -s ./.vimrc ~/

echo "prepare dein vim"
mkdir -p ~/.vim_runtime/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim_runtime/repos/github.com/Shougo/dein.vim
