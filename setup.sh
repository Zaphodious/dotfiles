#!/bin/bash

# Set up nix
if ! command -v nix-env &> /dev/null
then
    if grep -qi microsoft /proc/version
    then
        sh <(curl -L https://nixos.org/nix/install) --no-daemon
    else
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi
    . ~/.nix-profile/etc/profile.d/nix.sh
fi

# Install stuff we need
if ! command -v stow &> /dev/null
then
nix-env --install stow
fi

if ! command -v curl &> /dev/null
then
nix-env --install curl
fi

if ! command -v python3 &> /dev/null
then
nix-env --install curl
fi

if ! command -v cargo &> /dev/null
then
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    rustup update
fi

if ! command -v bob &> /dev/null
then
cargo install bob-nvim
bob install 0.8.3
bob use 0.8.3
fi

# Install Packer
[ -d "~/.local/share/nvim/site/pack/packer/start" ] && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


