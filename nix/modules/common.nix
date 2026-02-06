{ pkgs, ... }:
{
  environment.variables.EDITOR = "nvim";
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    aerospace
    cargo
    uv
    nix-direnv
    direnv
  ];

  homebrew = {
    onActivation = {
      # Fetch the newest stable branch of Homebrew's git repo
      autoUpdate = true;
      # Upgrade outdated casks, formulae, and App Store apps
      upgrade = true;
    };
    enable = true;
    taps = [ "FelixKratz/formulae" ];
    masApps = { };
    brews = [
      "curl"
      "fd"
      "fzf"
      "git"
      "gh"
      "exercism"
      "mas"
      "atuin"
      "git"
      "just"
      "lazygit"
      "mkcert"
      "gemini-cli"
      "neovim"
      "nixfmt"
      "pnpm"
      "ripgrep"
      "starship"
      "tmux"
      "watch"
      "wget"
      "yarn"
      "zoxide"
      "eza"
      "tree"
      "tldr"
      "stow"
      "bat"
      "coreutils"
      "moreutils"
    ];
    casks = [
      "chatgpt"
      "1password"
      "keycastr"
      "kitty"
      "obsidian"
      "telegram-desktop"
      "visual-studio-code"
      "discord"
      "docker-desktop"
      "logi-options+"
      "firefox"
      "google-chrome"
      "krisp"
      "polypane"
      "raycast"
      "spotify"
    ];
  };
  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    menuExtraClock.Show24Hour = true;
    dock = {
      expose-group-apps = true;
      autohide = true;
      orientation = "right";
      persistent-apps = [ ];
      show-recents = false; # disable recent apps
      tilesize = 32;

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
      _HIHideMenuBar = false;
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
}
