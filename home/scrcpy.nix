{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.scrcpy ];
}
