{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    jdk
    kitty
    pass
    pinentry_mac
  ];

  homebrew = {
    taps = [ ];
    masApps = {
      "1Password for Safari" = 1569813296;
    };
    brews = [
      "awscli"
      "opencode"
      "luarocks"
    ];
    casks = [
      "arc"
      "cloudflare-warp"
      "karabiner-elements"
      "plex-media-server"
      "pycharm"
      "slack"
      "tableplus"
      "tailscale"
      "webstorm"
      "whatsapp"
    ];
  };
}
