{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hyprland.nix
    ./pipewire.nix
    ./utils.nix
    ./wine.nix
  ];
}
