{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ nvtopPackages.full ];
}
