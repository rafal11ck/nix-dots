{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./gtk.nix
    ./cursor.nix
  ];
}
