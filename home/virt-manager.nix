{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ virt-manager ];
}