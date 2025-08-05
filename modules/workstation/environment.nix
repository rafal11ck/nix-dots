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

    hicolor-icon-theme
    material-symbols
    papirus-icon-theme
    (catppuccin-papirus-folders.override {
      accent = (lib.strings.toLower config.values.catppuccinAccent);
      flavor = (lib.strings.toLower config.values.catppuccinFlavor);
    })
    adwaita-icon-theme
    kdePackages.breeze
  ];
}
