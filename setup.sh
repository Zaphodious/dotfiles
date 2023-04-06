#!/bin/bash

# Get flags
while getopts b: flag 
do 
    case "${flag}" in 
    b) popshop_is_borked=true;;
esac
done

# Set up nix
if ! command -v nix-env &> /dev/null
then
    echo "Nix not detected. Installing." 
    if grep -qi microsoft /proc/version
    then
        sh <(curl -L https://nixos.org/nix/install) --no-daemon
    else
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi
    . ~/.nix-profile/etc/profile.d/nix.sh
    echo "Reload the shell and then run setup.sh once again"
    exit 3 # We can go no further until the shell has been reloaded
fi

# Install stuff we need
if ! command -v stow &> /dev/null
then
    echo "Stow not detected. Installing." 
    nix-env --install stow
fi

if ! command -v curl &> /dev/null
then
    echo "curl not detected. Installing." 
    nix-env --install curl
fi

if ! command -v javac &> /dev/null
then
    echo "OpenJDK not detected. Installing." 
    nix-env --install openjdk
fi

if ! command -v npm &> /dev/null
then
    echo "Node not detected. Installing." 
    nix-env --install nodejs
fi

if ! command -v gcc &> /dev/null && [[ $OSTYPE != 'darwin' ]];
then
    echo "GCC not detected. Installing." 
    nix-env --install gcc
fi

if ! command -v python3 &> /dev/null
then
    echo "Python3 not detected. Installing." 
    nix-env --install python3
fi

if ! command -v git &> /dev/null
then
    echo "Git not detected... somehow. Huh. Installing." 
    nix-env --install git
fi

if ! command -v cargo &> /dev/null
then
    echo "Rust not detected. Installing." 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Reload the shell and then run setup.sh once again"
    echo 3
else
    #DejaVu Sans Mono Book
    echo "Rust detected. Running rustup update." 
    rustup update
fi

if ! command -v bob &> /dev/null
then
    echo "Bob not detected. Installing, then installing neovim 0.8.3" 
    cargo install bob-nvim
    bob install 0.8.3
    bob use 0.8.3
fi

if ! command -v proompt &> /dev/null
then
    echo "Proompt not detected. Installing proompt"
    cargo install --git https://github.com/Zaphodious/proompt.git
fi

# Install Packer
if [ -d "~/.local/share/nvim/site/pack/packer/start" ] 
then
    echo "Packer not detected. Installing." 
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Make sure that WSL has access to my dev folder
if grep -qi microsoft /proc/version && [ -d "~/dev" ] 
then
    echo "WSL detected. Symlinking Alex's dev folder."
    ln -s /mnt/c/Users/achyt/dev/ ~/
fi

# If we've got apt, we want to update it.
if command -v apt &> /dev/null
then

    if [ popshop_is_borked == true ]
    then
        echo "If Pop! Shop is borked, we need to clean some stuff up"
        sudo rm -rf /var/lib/apt/lists/
        sudo apt clean
        sudo apt autoclean
        sudo apt update
        sudo dpkg --configure -a
        sudo apt --fix-broken-install
        sudo apt upgrade -y
    else
        echo "Running basic apt updates"
        sudo apt update -y
        sudo apt upgrade -y
    fi
fi

# We need apt for these installations, hence the earlier update
if command -v apt &> /dev/null
then
    echo "Installing fun things"
        sudo apt install -y neofetch cowsay cmatrix &> /dev/null
        cowsay "Alrighty, we're ready to rock!"
        neofetch
fi

