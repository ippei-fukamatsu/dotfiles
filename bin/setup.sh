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

# install VSCode Settings
SCRIPT_DIR=$HOME/dotfiles/vscode
VSCODE_SETTING_DIR=$HOME/.vscode
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
#ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

cat "$SCRIPT_DIR/extensions" | while read line
do
 code --install-extension $line
done

code --list-extensions > "$SCRIPT_DIR/extensions"

