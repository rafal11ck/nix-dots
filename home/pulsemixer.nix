{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.pulsemixer ];
}
