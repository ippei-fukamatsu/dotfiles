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

# setting for neovim
mkdir -p $HOME/.config/
ln -s $HOME/dotfiles/vim/ $HOME/.config/nvim

# setup nodenv plugins
# yarn
mkdir -p "$(nodenv root)/plugins"
git clone https://github.com/pine/nodenv-yarn-install.git "$(nodenv root)/plugins/nodenv-yarn-install"

