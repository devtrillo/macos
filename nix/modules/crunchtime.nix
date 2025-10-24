{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnupg
    jdk
    pass
    pass
    pinentry_mac
    slack
  ];

  system.primaryUser = "trillo";
  homebrew = {
    taps = [ "microsoft/mssql-release" ];
    masApps = { "1Password for Safari" = 1569813296; };
    brews = [
      "asdf"
      "awscli"
      "azure-cli"
      "direnv"
      "exercism"
      "graphviz"
      "msodbcsql18"
      "mssql-tools18"
      "python@3.11"
    ];
    casks = [ "kitty" "rider" "visual-studio-code@insiders" ];
  };
}
