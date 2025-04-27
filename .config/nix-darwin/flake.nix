{
  description = "Zenful Darwin  system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
     environment.systemPath = [ "/opt/homebrew/bin" ];  # M1
      environment.systemPackages = with pkgs; [
      	vim
	neovim
	mkalias
	cmatrix
	ffmpeg
	ffmpegthumbnailer
	neofetch
	rsync
    exiftool
    maxcso
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
	  "mpv"
	  "yazi"
      "spaceship"
      "gromgit/fuse/ntfs-3g-mac"
        ];
        casks = [
          "the-unarchiver"
	  "raycast"
      "bluebubbles"
      "macfuse"
      "mounty"
      "cursorcerer"
	  "proton-mail"
	  "proton-pass"
	  "protonvpn"
	  "wezterm"
      "signal"
	  "pronotes"
	  "topnotch"
	  "zoom"
      "zen-browser"
	  "citrix-workspace"
	  "reader"
	  "betterdisplay"
      "amethyst"
      "alt-tab"
      "qbittorrent"
      "balenaetcher"
      "commander-one"
        ];
        masApps = {
          "Adguard for Safari" = 1440147259;
	  "Dark Reader for Safari" = 1438243180;
	  "PayPal Honey for Safari" = 1472777122;
	  "Proton Pass for Safari" = 6502835663;
	  "Infuse • Video Player" = 1136220934;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      fonts.packages = [
	    #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        pkgs.nerd-fonts.jetbrains-mono
      ];

      #system.activationScripts.applications.text = let
      #  env = pkgs.buildEnv {
      #    name = "system-applications";
      #    paths = configuration.environment.systemPackages;
      #    pathsToLink = "/Applications";
      #  };
      #in
      #  pkgs.lib.mkForce ''
      #  # Set up applications.
      #  echo "setting up /Applications..." >&2
      #  rm -rf /Applications/Nix\ Apps
      #  mkdir -p /Applications/Nix\ Apps
      #  find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      #  while read -r src; do
      #    app_name=$(basename "$src")
      #    echo "copying $src" >&2
      #    ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      #  done
      #      '';

      system.defaults = {
        dock.autohide = true;
	dock.persistent-apps = [
	];
	loginwindow.GuestEnabled = false;
	NSGlobalDomain.AppleICUForce24HourTime = true;
      };

      # Auto upgrade nix package and the daemon service.
      #services.nix-daemon.enable = true;
      nix.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
	nix-homebrew.darwinModules.nix-homebrew
	{
	  nix-homebrew = {
	    enable = true;
	    enableRosetta = true;
	    user = "beffiom";
	  };
	}
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."air".pkgs;
  };
}
