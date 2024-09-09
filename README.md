# nixdots

This is nixos config repo

## Usage 

It it's impure because default is supposed to be universal and not copuled to hardware, It uses assumes that `hardware-config.nix` file is present at `/etc/nixos/hardware-config.nix` like one generated during nixOS installation process.

### NixOS
```sh
sudo nixos-rebuild switch --flake './#default' --impure
```
#### Why not "fix" impure?

Because copuling system config that is supposed to be "reproducable" with hardware turns it into firmware as it will work only with that system. I want config that is not copuled to any hardware.

### Nix home manager

Spin home-manager config using nix

``` sh
nix run home-manager/master -- switch --flake .
```
