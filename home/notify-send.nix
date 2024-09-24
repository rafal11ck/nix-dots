{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ notfiy-send ];
}
