{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./values.nix
    ./shared.nix

    ./style
    ./scripts

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
    "EDITOR" = "nvim";
    "VISUAL" = "code";
  };

  home.packages = with pkgs; [
    (flameshot.override { enableWlrSupport = true; })
    gimp
    networkmanagerapplet
    nsxiv
    pwvucontrol
    vesktop
    wev
  ];

  services = {
    blueman-applet.enable = true;
  };

  xdg.configFile."MangoHud" = {
    enable = true;
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/mangohud/.config/MangoHud";
  };
}
