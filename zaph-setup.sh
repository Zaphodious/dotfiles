#!/bin/bash -x

# Ensure we're in the home directory
cd ~/

# Get all the apt packages we'll need
sudo apt-get --assume-yes install gcc neovim git python3 openjdk-8-jdk leiningen grep byobu glances openssh roxterm

# Install the rust compiler, which is a dependency for the best parinfer vim plugin on the market
curl https://sh.rustup.rs -sSf | sh

# Install the clojure CLI tools
curl -O https://download.clojure.org/install/linux-install-1.9.0.391.sh
chmod +x linux-install-1.9.0.391.sh
sudo ./linux-install-1.9.0.391.sh

# Build parinfer-rust
cd .vim/bundle/parinfer-rust
cargo build --release
cd ~/ 

# Set the default editor to be Vim
export VISUAL=vim
export EDITOR="$VISUAL"
