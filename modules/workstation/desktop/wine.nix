{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.wineWowPackages.waylandFull
  ];
}
