# zplug
## check if zplug is installed
[[ -d ~/.zplug ]] || return
source ~/.zplug/init.zsh

# init
if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

## umask
umask 022

## manage everything
zplug "chrissicool/zsh-256color", use:"zsh-256color.plugin.zsh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin", \
  from:gh-r, \
  as:command, \
  rename-to:fzf, \
  use:"*darwin*amd64*"
zplug "mollifier/anyframe"
zplug "plugins/brew", from:oh-my-zsh, if:"which brew"
#zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux"
zplug "yous/lime"

## install plugins if they are not installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

## load zplug
zplug load

# options
## 補完候補を一覧で表示する
setopt auto_list
## 補完キー連打で候補順に自動で補完する
setopt auto_menu
## cd 時に自動でディレクトリスタックに追加する
setopt auto_pushd
## コマンド履歴に実行時間も記録する
setopt extended_history
## 履歴中の重複行をすべて削除する
setopt hist_ignore_all_dups
## 直前と重複するコマンドを記録しない
setopt hist_ignore_dups
## コマンド中の余分なスペースは削除して履歴に記録する
setopt hist_reduce_blanks
## 履歴と重複するコマンドを記録しない
setopt hist_save_no_dups
## ^D でシェルを終了しない
#setopt ignore_eof
## 履歴をすぐに追加する（通常はシェル終了時）
setopt inc_append_history
## # 以降をコメントとして扱う
setopt interactive_comments
## ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
## = 以降も補完する（例：--option=value）
setopt magic_equal_subst
## バックグラウンド処理の状態変化をすぐに通知する
setopt notify
## 8bit文字を有効にする
setopt print_eight_bit
## 終了ステータスが0以外の場合にステータスを表示する
setopt print_exit_value
## VCS情報の表示を有効にする
setopt prompt_subst
## ディレクトリスタックと重複したディレクトリをスタックに追加しない
setopt pushd_ignore_dups
## rm * の前に確認をとる
setopt rm_star_wait
## Zsh間で履歴を共有する
setopt share_history
## コマンド実行後は右プロンプトを消す
setopt transient_rprompt

# autoload
## フック機能を有効にする
autoload -Uz add-zsh-hook
## コマンドのオプションや引数を補完する
autoload -Uz compinit && compinit -u
## URLをエスケープする
autoload -Uz url-quote-magic
## VCS情報の表示を有効にする
autoload -Uz vcs_info

# completion
zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
  _approximate _list _history

# alias
bindkey -e
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias du="du -h"
alias df="df -h"

# plugin settings
## fzf
export FZF_DEFAULT_OPTS="--extended --ansi --multi"

# anyframe
bindkey '^@' anyframe-widget-cd-ghq-repository
bindkey '^r' anyframe-widget-put-history

# local environment
[ -f ~/zshrc.local ] && source ~/zshrc.local

