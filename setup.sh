#!/usr/bin/env bash


source ./setup_support.sh

setup-parse-args
setup-os-vars

# Set up nix
if needs-installing nix-env 
then
    echo "Nix not detected. Installing." 
    if $IS_WSL
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

if [ $OS != 'macos' ]
then
    if-needs-nix gcc
fi

if-needs-nix jq
if-needs-nix python3
if-needs-nix npm
if-needs-nix curl
if-needs-nix stow
if-needs-nix javac openjdk

if needs-installing zig
then
    install-zig
fi

if-needs-nix git

if needs-installing cargo
then
    echo "Rust not detected. Installing." 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Reload the shell and then run setup.sh once again"
    echo 3
else
    echo "Rust detected. Running rustup update." 
    rustup update
fi

if-needs-cargo bob bob-nvim
if-needs-cargo lsd
if-needs-cargo vivid
if-needs-cargo proompt "--git https://github.com/Zaphodious/proompt.git"

# Install Packer
if [ -d "~/.local/share/nvim/site/pack/packer/start" ] 
then
    echo "Packer not detected. Installing." 
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Make sure that WSL has access to my dev folder
if $IS_WSL && [ -d "~/dev" ] 
then
    echo "WSL detected. Symlinking Alex's dev folder."
    ln -s /mnt/c/Users/achyt/dev/ ~/
fi

# If we've got apt, we want to update it.
if is-installed apt
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

    echo "Installing fun things"
    sudo apt install -y neofetch cowsay cmatrix &> /dev/null
    cowsay "Alrighty, we're ready to rock!"
    neofetch

fi


