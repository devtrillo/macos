{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ kitty ];

  homebrew = {
    taps = [ ];
    masApps = { "1Password for Safari" = 1569813296; };
    brews = [ ];
    casks = [ "plex-media-server" "tailscale" ];
  };
}
