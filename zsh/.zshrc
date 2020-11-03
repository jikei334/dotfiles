DOTFILES_DIR=$(dirname $ZDOTDIR)

export XDG_CONFIG_HOME=${DOTFILES_DIR}

# X11 Display
export DISPLAY=localhost:0.0

export LANG=ja_JP.UTF-8

# 色を使える様にする
autoload -Uz colors
colors

# vim キーバインド
# bindkey -v

# ヒストリ設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 補完
autoload -Uz compinit
compinit

# バージョン管理状況を表示
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# beep を無効
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd

# pushd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# 履歴
setopt share_history
setopt hist_ignore_all_dups

# エイリアス
# cd
cdls() {
    builtin cd "$@" && ls
}

alias cd="cdls"

# 確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep='grep --color'

alias mkdir='mkdir -p'

# マシン特有の処理
OPTION_DIR="${HOME}/options"
if [ -e ${OPTION_DIR} ]
then
    for option_script in `ls ${OPTION_DIR}`
    do
        source ${OPTION_DIR}/${option_script}
    done
fi
