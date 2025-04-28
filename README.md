# How to get started

There are two commands to install

## Steps

1. sign in into mac app started

    ```bash
    sh <(curl -L https://nixos.org/nix/install)
    nix-shell -p git --run 'git clone this repo ~/dotfiles'
    nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flake ~/dotfiles/nix#mini
    ```

2. run the commands to install nixos
3. run `stow .` to configure all of the programs that we use
