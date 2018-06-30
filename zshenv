# Common
export PATH=${HOME}/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}

# editor
export EDITOR=nvim

# rbenv brew insatll
eval "$(rbenv init -)"

# go
export GOPATH=${HOME}/go
export PATH=${PATH}:${GOPATH}/bin

# nodebrew
export PATH=${HOME}/.nodebrew/current/bin:${PATH}
