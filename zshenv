# Common
export PATH=${HOME}/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}

# editor
export EDITOR=vim

## lang
export LANG=ja=JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

## history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export LISTMAX=50

# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH}
[[ -d ~/.rbenv ]] && eval "$(rbenv init -)"

# go
export GOPATH=${HOME}/go
export PATH="${GOPATH}/bin:${PATH}"

# nodebrew
export PATH=${HOME}/.nodebrew/current/bin:${PATH}
