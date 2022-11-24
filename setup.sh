#!/bin/bash

set -e

SETUP_DIR=$(dirname $0)/src
mkdir -p ~/src
sudo apt-get update
sudo apt install -y build-essential git libssl-dev nasm wget curl zlib1g-dev zsh libcurl4-openssl-dev zsh nasm yasm \
                    git cmake apt-transport-https ca-certificates gnupg software-properties-common \
                    meson ninja-build python3 python3-pip pkg-config libmount-dev flex bison \
                    libreadline-dev libghc-zlib-dev libbz2-dev vim clang-tidy-10

read -p "Install oh my zsh? [Y/n] " -n 1 -r
echo
if [[ "$REPLY" != "n" ]] ; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions $SETUP_DIR/custom/zsh-autosuggestions
    cp -R $SETUP_DIR/custom/* ~/.oh-my-zsh/custom
    cp $SETUP_DIR/.zshrc $SETUP_DIR/.vimrc $SETUP_DIR/.bashrc ~
fi

read -p "Install python env? [Y/n]" -n 1 -r
echo
if [[ "$REPLY" != "n" ]] ; then
    curl https://pyenv.run | bash
    cp $SETUP_DIR/.bashrc ~
    source ~/.bashrc
    pyenv install 3.10.0
    sudo pip install virtualenvwrapper
    pyenv local 3.10.0
    source ~/.bashrc
    mkvirtualenv --python $(pyenv which python) syndication_env
fi
