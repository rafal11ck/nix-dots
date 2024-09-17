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

    ./firefox.nix
    ./hyprland
    ./hyprpaper.nix
    ./pavucontrol.nix
    ./swaync.nix
    ./waybar.nix
  ];
}
