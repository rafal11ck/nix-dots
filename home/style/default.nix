{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./gtk.nix
    ./qt.nix
    ./cursor.nix

    ./catppuccin.nix
  ];
}
