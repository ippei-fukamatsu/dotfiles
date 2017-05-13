cd ~;
rm .vimrc .gvimrc .zshrc;

ln -s ~/.dotfiles/_vimrc .vimrc;
ln -s ~/.dotfiles/_gvimrc .gvimrc;
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

source ~/.zshrc

echo "done.";
echo "open vi and exec ':NeoBundleInstall'";

