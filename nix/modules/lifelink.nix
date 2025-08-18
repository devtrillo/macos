{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    awscli2
    slack

    gnupg
    pinentry_mac
  ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ ];
    casks = [ ];
  };
}
