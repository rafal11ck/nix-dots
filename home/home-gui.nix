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

    ./discord.nix
    ./firefox.nix
    ./hyprland
    ./hyprpaper.nix
    ./jellyfin-media-player.nix
    ./jellyfin-mpv-shim.nix
    ./pavucontrol.nix
    ./swaync.nix
    ./tofi.nix
    ./waybar.nix
  ];
}
