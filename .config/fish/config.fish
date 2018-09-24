set fish_theme fishface
fish_vi_key_bindings

set -x LANG ja_JP.utf8 

# alias TODO: porting alias from zsh
alias viconf='nvim ~/.config/fish/config.fish'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -lah --color=auto'
#alias so='source'
alias sf='source ~/.config/fish/config.fish'
alias v='nvim'
alias g='git'
alias gs='git status'
#alias vi='vim'
alias vf='nvim ~/.config/fish/config.fish'
alias vv='vim ~/.vimrc'
#alias c='cdr'
# historyに日付を表示

#alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias diff='diff -U1'
#if wsl...
#alias cdwin="cd /mnt/c/Users/levena"
alias du="du -h --max-depth=1"

set -x PATH $HOME/.anyenv/bin $PATH

#GOENV
set -x PATH $HOME/.anyenv/envs/goenv/bin/ $PATH
goenv rehash >/dev/null ^&1

set -x NDENV_ROOT "/root/.anyenv/envs/ndenv"
set -x PATH $PATH "/root/.anyenv/envs/ndenv/bin"
set -x PATH $NDENV_ROOT/shims $PATH


function history-merge --on-event fish_preexec
  history --save
  history --merge
end