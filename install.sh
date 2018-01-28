#!/bin/sh

echo "copy .zshrc & .gitconfig"
cp ./.zshrc ~/
cp ./.gitconfig ~/
cp ./.vimrc ~/
echo "prepare dein vim"
mkdir -p ~/.vim_runtime/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim_runtime/repos/github.com/Shougo/dein.vim
