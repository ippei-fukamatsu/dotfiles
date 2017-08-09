#!/bin/sh

DOTFILES_DIR=$HOME/dotfiles

if type git; then
  : #OK
else
  echo 'Please install git or update your path to include the git executable!'
  exit 1;
fi

git clone https://github.com/ippei-fukamatsu/dotfiles.git $HOME/dotfiles
sh $HOME/dotfiles/bin/setup.sh

source $HOME/.zshrc
echo "done.";

