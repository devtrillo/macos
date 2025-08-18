{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ slack ];

  homebrew = {
    taps = [ "microsoft/mssql-release" ];
    masApps = { "1Password for Safari" = 1569813296; };
    brews = [
      "python@3.11"
      "asdf"
      "awscli"
      "azure-cli"
      "direnv"
      "msodbcsql18"
      "mssql-tools18"
    ];
    casks = [ "rider" ];
  };
}
