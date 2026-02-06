{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry_mac
    pass
    jdk
  ];

  system.primaryUser = "trillo";
  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [
      "awscli"
      "opencode"
      "luarocks"
    ];
    casks = [
      "arc"
      "tableplus"
      "webstorm"
      "pycharm"
      "karabiner-elements"
      "slack"
      "whatsapp"
      "cloudflare-warp"
    ];
  };
}
