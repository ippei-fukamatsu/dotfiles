# path_helperというものがデフォルトで/etc/pathsの/usr/binなどを最後に読み込むので無効にする
# https://karur4n.hatenablog.com/entry/2016/01/18/100000
setopt no_global_rcs

# Common
export PATH=${HOME}/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}

# editor
export EDITOR=nvim

# rbenv
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/shims:${PATH}"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"

# go
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"

# nodenv
export NDENV_PATH="${HOME}/.nodenv"
export PATH="${NDENV_PATH}/bin:${PATH}"
eval "$(nodenv init -)"
