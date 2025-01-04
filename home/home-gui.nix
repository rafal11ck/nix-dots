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
    ./notify-send.nix
    ./nvtop.nix
    ./obs-studio.nix
    ./scrcpy.nix
    ./svp.nix
    ./swaync.nix
    ./texlive.nix
    ./thunderbird.nix
    ./tofi.nix
    ./virt-manager.nix
    ./vscode.nix
    ./waybar.nix
    ./wl-clipboard.nix
  ];

  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    "EDITOR" = "nvim";
    "VISUAL" = "code";
  };

  home.packages = with pkgs; [
    android-studio
    (flameshot.override { enableWlrSupport = true; })
    gimp
    networkmanagerapplet
    nsxiv
    pwvucontrol
    vesktop
    wev
    (flameshot.override { enableWlrSupport = true; })
    virt-viewer
    syncplay
    mermaid-cli
  ];

  services = {
    blueman-applet.enable = true;
    kdeconnect.enable = true;
  };

  programs = {
    swaylock.enable = true;
    zathura.enable = true;
  };

  xdg.configFile."MangoHud" = {
    enable = true;
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/mangohud/.config/MangoHud";
  };
}
