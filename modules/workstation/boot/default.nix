{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./plymouth.nix
    ./grub.nix
  ];
}
