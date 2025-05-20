{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = "nvim";
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    aerospace
    atuin
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
    starship
    stow
    telegram-desktop
    tmux
    tree
    tldr
    vscode
    watch
    sketchybar
    wget
    yarn
    zoxide
  ];

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
    brews = [ "thefuck" "eza" "mas" ];
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
  fonts.packages = with pkgs; [
    monocraft
    nerd-fonts.fira-code
    nerd-fonts.hack
  ];
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
}
