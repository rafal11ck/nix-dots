# nixdots

This is nix config repo


## Random links

https://search.nixos.org/packages?channel=unstable

https://search.nixos.org/options?channel=unstable

https://home-manager-options.extranix.com/

https://noogle.dev/

## Usage 

Enable flakes and nix command.
``` sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

### NixOS

```sh
sudo nixos-rebuild switch --flake './#local-hardware-config' --impure
```
#### Why not "fix" impure?

Because coupling system config that is supposed to be "reproducible" with hardware turns it into firmware as it will work only with that system. I want config that is not coupled to any hardware.

### Nix home manager

Spin home-manager config using nix it provides cli part of config only.

```sh
nix run home-manager/master -- switch --flake .
```



# Structure
    
[./dotfiles](./dotfiles) regular stow-able dot files

[./home](./home) nix home-manager home configuration.
It is split into two main files [home-cli](./home/home-cli.nix) and [home-gui](./home/home-gui.nix).
Which are responsible for command-line-interface and graphical user interface respectively.


By default [home.nix](./home/home.nix) should be used which imports both.

[/hosts](./hosts) Contains host specific configurations.

[./lib](./lib) Has some stuff that I don't understand, but use to define nixOS systems outside of main [flake](./flake.nix) module.

[./modules](./modules) Modules which could be called workflows.

[./pkgs] Custom pkgs.
