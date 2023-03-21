# Zaphodious' Personal Dotfiles

Remade in 2023.

1. Clone this repo to `~/dotfiles`. The position right under the 
home directory is important.

2. Run the setup.sh script. For each thing that it installs,
it will check to make sure it doesn't exist first. The script
uses the nix package manager to get coverage on both Linux and Mac.

Note that nix will install in single-user mode under WSL, and multi-user
mode elsewhere.

3. To use a given application's configs, run `stow <folder>`
from within the dotfiles directory. (fonts-windows being the exception. Just
install that font normally). Stow will create the symlinks necessary to
make the included dotfiles work.

