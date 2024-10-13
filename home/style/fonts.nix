{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    zlib # fix https://github.com/nix-community/home-manager/issues/703 in standalone hm
    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-lgc-plus
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
        "FiraCode"
        "DroidSansMono"
      ];
    })
  ];
}
