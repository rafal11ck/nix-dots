{
  config,
  lib,
  pkgs,
  catppuccin,
  ...
}:

{
  modules = [
    catppuccin.nixosModules.catppuccin
  ];
}
