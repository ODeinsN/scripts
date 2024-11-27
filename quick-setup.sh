#!/usr/bin/bash

SCRIPT_DIR=$(pwd)
header="$SCRIPT_DIR/header.sh"

$header "Installing Packages"
sudo apt install curl vim git wget zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
./install-vim-plug.sh

$header "setting up dotfiles"
git clone --bare https://github.com/odeinsn/dotfiles $HOME/dotfiles

config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

"$config" checkout -f
"$config" config --local status.showUntrackedFiles no

$header "setting up SSH"
mkdir .ssh
cd .ssh
ssh-keygen -t ed25519

$header "done"
