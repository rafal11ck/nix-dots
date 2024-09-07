# nixdots

This is nixos config repo

## Usage 

```sh
sudo nixos-rebuild switch --flake './#default' --impure
```
### Why impure?

Because copuling system config that is supposed to be "reproducable" with hardware turns it into firmware as it will work only with that system. I want config that is not copuled to any hardware.
