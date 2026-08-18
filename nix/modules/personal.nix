{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    jdk
    kitty
    pass
    pinentry_mac
  ];

  system.primaryUser = "trillo";
}
