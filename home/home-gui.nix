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

    ./style

    ./discord.nix
    ./firefox.nix
    ./hyprland
    ./hyprpaper.nix
    ./jellyfin-media-player.nix
    ./jellyfin-mpv-shim.nix
    ./keepassxc.nix
    ./mpv.nix
    ./nautilus.nix
    ./nvtop.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./svp.nix
    ./swaync.nix
    ./tofi.nix
    ./waybar.nix
    ./wl-clipboard.nix
  ];
}
