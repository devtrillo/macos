{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    jetbrains.webstorm
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
      "luarocks"
    ];
    casks = [
      "arc"
      "karabiner-elements"
      "slack"
      "whatsapp"
      "cloudflare-warp"
    ];
  };
}
