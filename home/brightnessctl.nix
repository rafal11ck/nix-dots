{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.brightnessctl ];
}
