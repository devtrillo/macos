{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core
    , homebrew-cask, }:
    let
      configuration = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;
        # $ nix-env -qaP | grep wget
        environment.systemPackages = with pkgs; [
          aerospace
          atuin
          awscli2
          bat
          cargo
          chatgpt
          coreutils
          curl
          fd
          fzf
          gh
          git
          just
          keycastr
          kitty
          lazygit
          mkcert
          moreutils
          neovim
          nixfmt-classic
          obsidian
          pnpm
          ripgrep
          slack
          starship
          stow
          telegram-desktop
          tmux
          tree
          vscode
          watch
          wget
          yarn
          zoxide
        ];

        environment.variables.EDITOR = "nvim";

        homebrew = {
          onActivation = {
            # Fetch the newest stable branch of Homebrew's git repo
            autoUpdate = true;
            # Upgrade outdated casks, formulae, and App Store apps
            upgrade = true;
            # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
            cleanup = "zap";
          };
          enable = true;
          taps = [ "FelixKratz/formulae" ];
          masApps = { "1Password for Safari" = 1569813296; };
          brews = [
            {
              name = "sketchybar";
              restart_service = true;
            }
            "eza"
            "mas"
          ];
          casks = [
            "1password"
            "discord"
            "docker"
            "figma"
            "firefox"
            "google-chrome"
            "krisp"
            "polypane"
            "raycast"
            "spotify"
            "uhk-agent"
            "webstorm"
          ];
        };

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        programs.zsh.enable = true;

        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        nixpkgs.hostPlatform = "aarch64-darwin";
        security.pam.services.sudo_local.touchIdAuth = true;
        fonts.packages = with pkgs; [
          nerd-fonts.fira-code
          nerd-fonts.droid-sans-mono
        ];
        system.defaults = {
          loginwindow = {
            GuestEnabled = false; # disable guest user
            SHOWFULLNAME = true; # show full name in login window
          };
          menuExtraClock.Show24Hour = true;
          dock = {
            autohide = true;
            orientation = "right";
            persistent-apps = [ ];
            show-recents = false; # disable recent apps
          };
          finder = {
            _FXShowPosixPathInTitle = true;
            AppleShowAllExtensions = true;
            FXEnableExtensionChangeWarning = false;
            QuitMenuItem = true;
            ShowPathbar = true;
            ShowStatusBar = true;
          };
          NSGlobalDomain = {
            "com.apple.swipescrolldirection" = true;
            "com.apple.sound.beep.feedback" = 0;
            AppleInterfaceStyle = "Dark";
            AppleKeyboardUIMode = 3;
            _HIHideMenuBar = true;
            ApplePressAndHoldEnabled = true;
            InitialKeyRepeat = 15;
            KeyRepeat = 1;
            NSAutomaticCapitalizationEnabled = false;
            NSAutomaticDashSubstitutionEnabled = false;
            NSAutomaticPeriodSubstitutionEnabled = false;
            NSAutomaticQuoteSubstitutionEnabled = false;
            NSAutomaticSpellingCorrectionEnabled = false;
            NSNavPanelExpandedStateForSaveMode = true;
            NSNavPanelExpandedStateForSaveMode2 = true;
          };
        };
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "trillo";
              autoMigrate = true;
            };
          }
        ];
      };
    };
}
