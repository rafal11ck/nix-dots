{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.ripgrep = {
    enable = true;
  };
}
