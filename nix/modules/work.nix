{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ awscli2 ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ ];
    casks = [ ];
  };
}
