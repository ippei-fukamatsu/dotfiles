#!/bin/bash

 # 最新の各バージョンのインストール
 # setup nodenv plugins
 # yarn
 mkdir -p "$(nodenv root)/plugins"
 git clone https://github.com/pine/nodenv-yarn-install.git "$(nodenv root)/plugins/nodenv-yarn-install"

 # install python
 python2=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1)
 python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
 pyenv install $python2
 pyenv install $python3
 pyenv global $python2 $python3
 pyenv rehash

 # insrtall ruby
 rbenv install -l | grep -v - | tail -1
