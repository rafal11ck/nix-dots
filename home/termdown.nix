{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ termdown ];
}
