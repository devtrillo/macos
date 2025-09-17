{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    awscli2
    gnupg
    jetbrains.webstorm
    pinentry_mac
    pass
  ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ "luarocks" ];
    casks = [
      "arc"
      "karabiner-elements"
      "slack"
      "visual-studio-code@insiders"
      "whatsapp"
    ];
  };
}
