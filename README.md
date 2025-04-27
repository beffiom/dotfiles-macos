# dotfiles-macos
MacOS Dotfiles with Nix Darwin Config

## Setup
### I. Install Nix
sh <(curl -L https://nixos.org/nix/install)

### II. Install nix-darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

### III. Update flake
nix run nix-darwin -- switch --flake ~/.config/nix-darwin#air

## zsh alias to update flake
zsh aliases found in ~/.zshrc

alias update-nix="darwin-rebuild switch --flake ~/.config/nix-darwin#air"
alias edit-nix="nvim ~/.config/nix-darwin/flake.nix"
