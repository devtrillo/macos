{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ awscli2 slack ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ ];
    casks = [ "aptible" ];
  };
}
