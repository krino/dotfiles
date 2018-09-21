#!/bin/bash

log_file=~/install_progress_log.txt

# Install git, git-completion and git-prompt
cd ~/
sudo apt-get -y git curl
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ~/git-completion.bash ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo "git-completion and git-prompt Installed and Configured" >> $log_file

# install tmux
sudo apt-get -y install tmux tmuxinator fonts-powerline
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# remember to C-A I to load the plugins

# install neovim
sudo apt-get -y install python2 python3 python-pip python3-pip
sudo apt-get -y install neovim python-neovim python3-neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

if type -p nvim > /dev/null; then
    echo "neovim Installed" >> $log_file
else
    echo "neovim FAILED TO INSTALL!!!" >> $log_file
fi

# install exuberant-ctags
sudo apt-get -y install exuberant-ctags
if type -p ctags > /dev/null; then
    echo "ctags installed" >> $log_file
else
    echo "ctags FAILED TO INSTALL!!!" >> $log_file
fi

# install sexpdata
pip install sexpdata websocket-client
pip3 install sexpdata websocket-client

# install vim-plug

# setting zsh as default shell
chsh -s /usr/bin/zsh

# remove any existing config
rm -rf ~/.vim ~/.vimrc ~/.tmux ~/.tmux.conf ~/.config/nvim ~/.ctags 2> /dev/null

# install zsh
sudo apt-get -y install zsh 
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi
sudo apt-get install zsh-syntax-highlighting xcape

# creating necessary directories
mkdir -p ~/.config ~/.config/nvim

# linking configs
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/ctags ~/.ctags


# remember to C-A I to load the plugins
#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s dotfiles/oh-my-zsh-custom.zsh ~/.oh-my-zsh/

