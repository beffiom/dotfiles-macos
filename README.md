# dotfiles-macos
MacOS Dotfiles with Nix Darwin Config

## Setup
### I. Install Nix
sh <(curl -L https://nixos.org/nix/install)

### II. Install nix-darwin
nix run nix-darwin -- switch --flake ~/.config/nix-darwin#air

## Updating nix-darwin config
zsh aliases found in ~/.zshrc

alias update-nix="darwin-rebuild switch --flake ~/.config/nix-darwin#air"
alias edit-nix="nvim ~/.config/nix-darwin/flake.nix"
