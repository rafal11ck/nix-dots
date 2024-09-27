{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    font-awesome
  ];
}
