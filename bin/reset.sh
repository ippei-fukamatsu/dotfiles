#!/bin/bash

files=( vimrc gvimrc zshenv zshrc viminfo bashrc gitconfig zcompdump )
directories=( vim config zplug )

for file in ${files[@]}
do
  if rm -f $HOME/.${file}; then
    echo "removed ${file}."
  else
    echo "failed to remove ${file}."
  fi
done

for directory in ${directories[@]}
do
  if rm -rf $HOME/.${directory}; then
    echo "removed ${directory}."
  else
    echo "failed to remove ${directory}."
  fi
done
