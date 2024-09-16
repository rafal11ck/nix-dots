{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./values.nix
    ./shared.nix

    ./hyprland
    ./waybar.nix
    ./hyprpaper.nix
    ./swaync.nix
  ];
}
