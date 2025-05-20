{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ kitty ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ ];
    casks = [ "plex-media-server" "tailscale" ];
  };
}
