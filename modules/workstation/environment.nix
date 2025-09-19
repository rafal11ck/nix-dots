{
  pkgs,
  config,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    docker-compose
    pydf
    tesseract

    papirus-icon-theme
    hicolor-icon-theme
    material-symbols

    (catppuccin-papirus-folders.override {
      accent = (lib.strings.toLower config.values.catppuccinAccent);
      flavor = (lib.strings.toLower config.values.catppuccinFlavor);
    })
    adwaita-icon-theme
    kdePackages.breeze

    pv-migrate

    #caelstia dots need those
    hyprpicker
    hypridle
    wl-clipboard
    cliphist
    bluez
    bluez-tools
    inotify-tools
    app2unit
    wireplumber
    trash-cli
    foot
    fish
    fastfetch
    starship
    btop
    jq
    socat
    imagemagick
    curl
    adw-gtk3
    papirus-icon-theme
    kdePackages.qt6ct
    libsForQt5.qt5ct
    nerd-fonts.jetbrains-mono
  ];
}
