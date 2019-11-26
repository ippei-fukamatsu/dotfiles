# Common
export PATH=${HOME}/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}

# editor
export EDITOR=nvim

# rbenv brew insatll
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# go
export GOPATH="${HOME}/go"
export PATH=${PATH}:${GOPATH}/bin

# nodeenv
export NDENV_PATH="$HOME/.nodenv"
export PATH=${PATH}:${NDENV_PATH}/bin
eval "$(nodenv init -)"
