cd ~;

ln -s ~/.dotfiles/_vimrc .vimrc;
ln -s ~/.dotfiles/_gvimrc .gvimrc;
ln -s ~/.dotfiles/_bashrc .bashrc;
ln -s ~/.dotfiles/_bash_profile .bash_profile;

source .bash_profile;

# install neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh;
sh ./install.sh;
rm -rf install.sh;

echo "done.";
echo "open vi and exec ':NeoBundleInstall'";

