#!/bin/bash

# remove those files is they are not links - that means we are on clean system
[ ! -L ~/.bashrc ] && rm ~/.bashrc
[ ! -L ~/.profile ] && rm ~/.profile

# this to prevent folder optimization that stow is doing
mkdir -p ~/.local/share/mc/skins
mkdir -p ~/.local/bin
mkdir -p ~/.config

# basic system stuff
sudo apt -y install stow pip mc
sudo pip install powerline-status netifaces

# if there is no .bashrc that means we are on clean system
if [ ! -e ~/.bashrc ]; then
    pushd ~/.dotfiles
    stow */
    popd
fi

# nvim
if ! which nvim > /dev/null; then
    wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage

    sudo chown root:root nvim.appimage
    sudo chmod a+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/
    pushd /usr/local/bin
    sudo ln -s nvim.appimage nvim
    popd

    # nvim Python integration module
    sudo pip install neovim
    # this is needed otherwise yank to system clipboard will not work
    sudo apt install xclip

    # packer.nvim bootstrap
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
         ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# rg command https://github.com/BurntSushi/ripgrep
if ! which rg > /dev/null; then
    wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    sudo dpkg -i ripgrep_13.0.0_amd64.deb
    rm ripgrep_13.0.0_amd64.deb
fi

# fd command https://github.com/sharkdp/fd
# it is used in telescope.nvim mostly
if ! which fd > /dev/null; then
    wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
    sudo dpkg -i fd_8.2.1_amd64.deb
    rm fd_8.2.1_amd64.deb
fi

# fzf
if ! which fzf > /dev/null; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
fi

# exa
if ! which exa > /dev/null; then
    tmp=`mktemp -d`
    pushd "$tmp"
    wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
    unzip exa-linux-x86_64-v0.10.1.zip
    sudo chown root:root ./bin/exa
    sudo cp ./bin/exa /usr/local/bin/
    popd
    rm -rf "$tmp"
fi

# Hack Nerd font
if [[ ! -e /usr/share/fonts/Hack ]]; then
    sudo mkdir /usr/share/fonts/Hack
    tmp=`mktemp`
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -O "$tmp"
    sudo unzip "$tmp" -d /usr/share/fonts/Hack
    rm "$tmp"
fi

# development tools
sudo apt -y install cmake clangd ninja-build

if ! which clangd-13 > /dev/null; then
    pushd /tmp
    sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
    popd
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-13 100
fi

