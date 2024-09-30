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
    ./scripts

    ./discord.nix
    ./ffmpeg.nix
    ./firefox.nix
    ./hypridle.nix
    ./hyprland
    ./hyprpaper.nix
    ./jellyfin-media-player.nix
    ./jellyfin-mpv-shim.nix
    ./keepassxc.nix
    ./mpv.nix
    ./nautilus.nix
    ./notify-send.nix
    ./nvtop.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./scrcpy.nix
    ./svp.nix
    ./swaylock.nix
    ./swaync.nix
    ./thunderbird.nix
    ./tofi.nix
    ./virt-manager.nix
    ./waybar.nix
    ./wl-clipboard.nix
  ];
}
