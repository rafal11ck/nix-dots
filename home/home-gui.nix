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

    ./vscode.nix
    ./tofi.nix
    ./emacs.nix
    ./firefox.nix
  ];

  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    "EDITOR" = "nvim";
    "VISUAL" = "code";
  };

  home.packages = with pkgs; [
    ddcutil
    (flameshot.override { enableWlrSupport = true; })
    gimp
    networkmanagerapplet
    nsxiv
    pwvucontrol
    (vesktop.override {
      electron = pkgs.electron_32; # FIXME https://github.com/NixOS/nixpkgs/issues/380429
    })
    wev
    virt-viewer
    syncplay
    mermaid-cli
    wlogout
    jellyfin-mpv-shim
    ffmpeg
    jellyfin-media-player
    jellyfin-mpv-shim
    brightnessctl
    keepassxc
    libreoffice
    libnotify
    scrcpy
    svp
    thunderbird
    virt-manager
    gammastep
    material-design-icons
    iosevka
    font-awesome
    wl-clipboard
    zathura
    swaynotificationcenter
    swappy
    slurp
    grim
  ];

  services = {
    blueman-applet.enable = true;
    kdeconnect = {
      enable = true;
      indicator = true;
    };
    hypridle.enable = true;
    hyprpaper.enable = true;
  };

  systemd.user.targets = {

    # HACK Fix services depending on tray.traget
    # https://github.com/nix-community/home-manager/issues/6329#issuecomment-2598736548
    # workaround https://github.com/nix-community/home-manager/issues/6329
    tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };

  programs = {
    waybar = {
      enable = true;
      systemd = {
        # workaround https://github.com/nix-community/home-manager/issues/5927
        # Starting waybar from WM directly
        enable = true;
      };
    };
    swaylock.enable = true;
    foot = {
      enable = true;
      server = {
        enable = true;
      };
    };
    mpv = {
      enable = true;
    };
    obs-studio = {
      enable = true;
    };
  };

}
