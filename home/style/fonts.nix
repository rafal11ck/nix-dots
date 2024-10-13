{
  config,
  lib,
  pkgs,
  ...
}:

{

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    noto-fonts
    (nerdfonts.override {
      fonts = [
        "Iosevka"
        "FiraCode"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}
