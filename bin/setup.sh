#!/bin/bash

dotfiles=( vim vimrc gvimrc zshenv zshrc viminfo bashrc gitconfig )
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

# install python3
brew install python3

# install neovim
brew install neovim
pip3 install neovim

# install ripgrep
brew install ripgrep

# setting for neovim
mkdir -p $HOME/.config/
ln -s $HOME/dotfiles/vim/ $HOME/.config/nvim

