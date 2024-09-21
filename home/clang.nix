{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ clang-tools ];
}
