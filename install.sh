#!/bin/sh

echo "copy .zshrc & .gitconfig"

exist_files() {
    if [ -f ~/$1 ] && [ -n "$1" ];
    then
        echo "$1 is exist. cp and rm"
        cp ~/$1 ~/$1.bak
        rm ~/$1
    fi
}

exist_files ".zshrc"
ln -s `pwd`/.zshrc ~/

exist_files ".gitconfig"
ln -s `pwd`/.gitconfig ~/

exist_files ".vimrc"
ln -s `pwd`/.vimrc ~/

exist_files ".tmux.conf"
ln -s `pwd`/.tmux.conf ~/

#ln -s `pwd`/.config/fish/config.fish.zsh ~/.config/fish/config.fish

if [ ! -d ~/.vim_runtime/repos/github.com/Shougo/dein.vim/bin/ ];
then
    echo "prepare dein vim"
    mkdir -p ~/.vim_runtime/repos/github.com/Shougo/dein.vim
    git clone https://github.com/Shougo/dein.vim.git \
            ~/.vim_runtime/repos/github.com/Shougo/dein.vim
else
    echo "dain vim is aleady installed? check dir"
fi


if [ ! -d ~/.gitignore_all_dir ];
then
    echo "prepare .config/git/*"
    mkdir -p ~/.config/git
    exist_files ".config/git/ignore"
    ln -s `pwd`/.config/git/ignore ~/.config/git/ignore
    exist_files ".config/git/gitcommitmsg"
    ln -s `pwd`/.config/git/gitcommitmsg ~/.config/git/gitcommitmsg

    mkdir -p ~/.gitignore_all_dir
    git clone https://github.com/github/gitignore.git \
            ~/.gitignore_all_dir
else
    echo "gitignore is aleady installed? check dir"
fi

echo "nautilus setting"
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
gsettings set org.gnome.desktop.background show-desktop-icons true