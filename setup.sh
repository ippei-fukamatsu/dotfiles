cd ~;
rm .vimrc .gvimrc .bashrc .bash_profile .zshrc;

ln -s ~/.dotfiles/_vimrc .vimrc;
ln -s ~/.dotfiles/_gvimrc .gvimrc;
ln -s ~/.dotfiles/_bashrc .bashrc;
ln -s ~/.dotfiles/_bash_profile .bash_profile;
ln -s ~/.dotfiles/_zshrc .zshrc;

# install zsh
brew install zsh

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#source .bash_profile;
source .zshrc;

# install neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh;
sh ./install.sh;
rm -rf install.sh;

echo "done.";
echo "open vi and exec ':NeoBundleInstall'";

