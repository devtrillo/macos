{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ clojure ];

  homebrew = {
    taps = [ ];
    masApps = { };
    brews = [ "python@3.11" ];
    casks = [ "rider" ];
  };
}
