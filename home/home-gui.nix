{
  pkgs,
  ...
}:
{
  imports = [
    ./values.nix
    ./shared.nix

    ./style
    ./scripts

    ./blueman-applet.nix

    ./brightnessctl.nix
    ./ffmpeg.nix
    ./firefox.nix
    ./hypridle.nix
    ./hyprland
    ./hyprpaper.nix
    ./jellyfin-media-player.nix
    ./jellyfin-mpv-shim.nix
    ./keepassxc.nix
    ./libreoffice.nix
    ./mpv.nix
    ./nautilus.nix
    ./notify-send.nix
    ./nvtop.nix
    ./obs-studio.nix
    ./scrcpy.nix
    ./svp.nix
    ./swaylock.nix
    ./swaync.nix
    ./texlive.nix
    ./thunderbird.nix
    ./tofi.nix
    ./virt-manager.nix
    ./vscode.nix
    ./waybar.nix
    ./wl-clipboard.nix
    ./zathura.nix
  ];

  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    "VISUAL" = "code";
  };

  home.packages = with pkgs; [
    nsxiv
    pwvucontrol
    vesktop
    gimp
  ];
}
