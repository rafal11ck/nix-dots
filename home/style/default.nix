{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./cursor.nix
    ./fonts.nix
    ./gtk.nix
    ./qt.nix

    ./catppuccin.nix
  ];
}
