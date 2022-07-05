#!/bin/bash

# remove those files is they are not links - that means we are on clean system
[ ! -L ~/.bashrc ] && rm ~/.bashrc
[ ! -L ~/.profile ] && rm ~/.profile

# in lxc containers there is no ~/.cache directory
[ ! -e ~/.cache ] && mkdir ~/.cache

# basic system stuff
sudo apt -y install stow pip mc fontconfig curl
sudo pip install powerline-status netifaces
sudo snap install btop

# if there is no .bashrc that means we are on clean system
if [ ! -e ~/.bashrc ]; then
    pushd ~/.dotfiles
    stow --no-folding */ || { echo 'Initial stow has failed. Stopping...'; exit 1; }
    popd
fi

# git - install latest from ppa
git_core_list="/etc/apt/sources.list.d/git-core-ubuntu-ppa-$(lsb_release -cs).list"
if [[ ! -f "$git_core_list" ]]; then
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update
    sudo apt -y install git
fi

# nvim
# remove appimage variant first if any
if [[ -L /usr/local/bin/nvim && -f /usr/local/bin/nvim.appimage ]]; then
    sudo rm /usr/local/bin/nvim*
fi

if ! which nvim > /dev/null; then
    wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
    sudo dpkg -i nvim-linux64.deb
    rm nvim-linux64.deb

    # nvim Python integration module
    sudo pip install neovim
    # this is needed otherwise yank to system clipboard will not work
    sudo apt -y install xclip

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

# fzf tab completion
if [ ! -e ~/.fzf-tab-completion/bash/fzf-bash-completion.sh ]; then
    git clone https://github.com/lincheney/fzf-tab-completion ~/.fzf-tab-completion
fi

if ! which zoxide > /dev/null; then
    curl -sS https://webinstall.dev/zoxide | bash
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

# vivid to create LS_COLORS easily
if ! which vivid > /dev/null; then
    wget https://github.com/sharkdp/vivid/releases/download/v0.7.0/vivid_0.7.0_amd64.deb
    sudo dpkg -i vivid_0.7.0_amd64.deb
    rm vivid_0.7.0_amd64.deb
fi

# Hack Nerd font
if [[ `fc-list | grep -m 1 -c "Hack Nerd"` == '0' ]]; then
    sudo mkdir /usr/local/share/fonts/Hack
    tmp=`mktemp`
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -O "$tmp"
    sudo unzip "$tmp" -d /usr/local/share/fonts/Hack
    rm "$tmp"
    sudo fc-cache -f -v
fi

# development tools
sudo apt -y install cmake clangd ninja-build

if ! which clangd-14 > /dev/null; then
    tmp=`mktemp`
    wget https://apt.llvm.org/llvm.sh -O "$tmp"
    chmod +x "$tmp"
    sudo "$tmp" 14
    rm "$tmp"
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-14 100

    sudo apt -y remove clangd-13
fi

