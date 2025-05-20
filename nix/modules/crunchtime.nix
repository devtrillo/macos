{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ clojure slack ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ "python@3.11" ];
    casks = [ "rider" ];
  };
}
