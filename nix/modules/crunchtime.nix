{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ slack ];

  homebrew = {
    taps = [ "microsoft/mssql-release" ];
    masApps = { };
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
