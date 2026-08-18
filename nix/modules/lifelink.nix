{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry_mac
    pass
    jdk
  ];

  system.primaryUser = "trillo";
}
