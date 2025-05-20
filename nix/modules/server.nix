{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ awscli2 ];

  homebrew = {
    enabled = false;
    taps = [ ];
    masApps = { };
    brews = [ ];
    casks = [ ];
  };
}
