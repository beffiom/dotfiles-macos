source /opt/homebrew/opt/spaceship/spaceship.zsh

alias e="nvim"
alias edit="nvim"
alias yazi="yazi --cwd-file $(pwd)"
alias vifm="bash ~/.config/vifm/scripts/vifmrun"
alias f="yazi --cwd-file $(pwd)"
alias ls="ls -h --color=auto"
alias la="ls -A"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ytd="yt-dlp --format bestvideo+bestaudio --progress --console-title --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(uploader)s] %(title)s'"
alias ytd-date="yt-dlp --format bestvideo+bestaudio --progress --console-title --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --sponsorblock-remove Sponsor -o '[%(upload_date)s %(uploader)s] %(title)s'"
alias yta="yt-dlp -x --format m4a"
alias update-nix="darwin-rebuild switch --flake ~/.config/nix-darwin#air"
alias edit-nix="nvim ~/.config/nix-darwin/flake.nix"

