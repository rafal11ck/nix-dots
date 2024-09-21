{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ wl-clipboard ];
}
