{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./utils.nix
    ./hyprland.nix
    ./pipewire.nix
  ];
}
