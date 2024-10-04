{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.texliveFull ] ;
}
