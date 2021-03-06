#!/bin/sh

DOTFILES_DIR=$HOME/dotfiles

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install cask
brew install cask

if type git; then
  : #OK
else
  echo 'Please install git or update your path to include the git executable!'
  exit 1;
fi

git clone https://github.com/ippei-fukamatsu/dotfiles.git $DOTFILES_DIR

# homebrew-bundle
brew bundle --file $DOTFILES_DIR/Brewfile

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sh $DOTFILES_DIR/bin/setup.sh

source $HOME/.zshrc

sh $DOTFILES_DIR/bin/after_source.sh

echo "done.";

