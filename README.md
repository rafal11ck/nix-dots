# nixdots

This is nix config repo

## Usage 

Enable flakes and nix command.
``` sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

### NixOS

It it's impure because default is supposed to be universal and not coupled to hardware, It uses assumes that `hardware-config.nix` file is present at `/etc/nixos/hardware-config.nix` like one generated during nixOS installation process.

```sh
sudo nixos-rebuild switch --flake './#local-hardware-config' --impure
```
#### Why not "fix" impure?

Because coupling system config that is supposed to be "reproducible" with hardware turns it into firmware as it will work only with that system. I want config that is not coupled to any hardware.

### Nix home manager

Spin home-manager config using nix it provides cli part of config only.

``` sh
nix run home-manager/master -- switch --flake .
```

## Random links

https://search.nixos.org/packages?channel=unstable

https://search.nixos.org/options?channel=unstable

https://home-manager-options.extranix.com/

https://noogle.dev/
