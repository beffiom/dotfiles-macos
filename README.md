# dotfiles-macos
MacOS Dotfiles with Nix Darwin Config

## Setup
### I. Install Nix
```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### II. Install Nix-Darwin
```
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin

nix --extra-experimental-features "nix-command flakes" flake init -t ~/.config/nix-darwin/master

sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
```

### III. Update flake
1. cd to ~/.config/nix-darwin
2. nix flake init -t nix-darwin
3. ensure ~/.config/nix-darwin has the file from this repo
4. nix run nix-darwin -- switch --flake ~/.config/nix-darwin#air

## zsh alias to update flake
zsh aliases found in ~/.zshrc

alias update-nix="darwin-rebuild switch --flake ~/.config/nix-darwin#air"
alias edit-nix="nvim ~/.config/nix-darwin/flake.nix"
