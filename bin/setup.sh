#!/bin/bash

#dotfiles=( vim vimrc zshenv zshrc tmux.conf tmux vimshrc bashrc gitconfig agignore vimperatorrc vimperator)
dotfiles=( vim vimrc gvimrc zshrc viminfo bashrc gitconfig )
for file in ${dotfiles[@]}
do
  if [ -a $HOME/.$file ]; then
    echo ".$file already exists."
  else
    ln -s $HOME/dotfiles/$file $HOME/.$file
    echo "success to create symlink .$file"
  fi
done

cd $HOME/dotfiles

# install zplug
curl -sL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install neovim
brew install neovim

# install python3
brew install python3

# setting for neovim
mkdir -p $HOME/.config/nvim
ln -s $HOME/dotfiles/vimrc $HOME/.config/nvim/init.vim

