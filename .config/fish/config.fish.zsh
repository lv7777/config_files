# wttr
alias wttr="curl -4 http://wttr.in"

# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors


# 補完
autoload -Uz compinit
compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# 他のターミナルとヒストリーを共有
setopt share_history


# ヒストリーに重複を表示しない
setopt histignorealldups

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
#setopt auto_pushd

# pushdから重複を削除
#setopt pushd_ignore_dups

# コマンドミスを修正
#setopt correct


# エイリアス
#alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -lah --color=auto'
alias so='source'
alias sz='source ~/.zshrc'
alias v='vim'
alias g='git'
alias gs='git status'
#alias vi='vim'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
#alias c='cdr'
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
#alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
#alias ..='c ../'
#alias back='pushd'
alias diff='diff -U1'

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
#%# "


# プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
%# "

# mkdirとcdを同時実行
function mkcd
  if test -d $argv[1]
    #  then
    echo "$argv[1] already exists!"
    cd $argv[1]
  else
    # && is not used in fish
    mkdir -p $argv[1]; and cd $argv[1]
  end
  #fi
end

# git設定
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# FIXME: also fish is not used ||
#if [ -d /mnt/c/WINDOWS ] || [ $LC_WINDOWS10 ]; then
#  export WINDOWS10=0
#fi
#if [ $WINDOWS10 ]; then
#  export LC_WINDOWS10=$WINDOWS10
#fi
