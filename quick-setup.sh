#!/usr/bin/bash

header="./header.sh"

$header "Installing Packages"
sudo apt install curl vim git zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
./install-vim-plug.sh

$header "Making zsh default"
chsh -s $(which zsh)

$header "setting up dotfiles"
git clone --bare https://github.com/odeinsn/dotfiles $HOME/dotfiles

config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

cd $HOME

$config checkout -f
$config config --local status.showUntrackedFiles no

$header "setting up SSH"
mkdir .ssh
cd .ssh
ssh-keygen -t ed25519

$header "done"
