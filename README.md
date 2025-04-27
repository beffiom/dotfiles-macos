# dotfiles-macos
MacOS Dotfiles with Nix Darwin Config

## Setup
### I. Install Nix
sh <(curl -L https://nixos.org/nix/install)

### II. Install Nix-Darwin
1. sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/master.tar.gz darwin
2. sudo nix-channel --update
3. nix-env -iA darwin

### III. Update flake
1. cd to ~/.config/nix-darwin
2. nix flake init -t nix-darwin
3. ensure ~/.config/nix-darwin has the file from this repo
4. nix run nix-darwin -- switch --flake ~/.config/nix-darwin#air

## zsh alias to update flake
zsh aliases found in ~/.zshrc

alias update-nix="darwin-rebuild switch --flake ~/.config/nix-darwin#air"
alias edit-nix="nvim ~/.config/nix-darwin/flake.nix"
