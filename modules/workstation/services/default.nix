{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./davfs2.nix
    ./dictd.nix
    ./gvfs.nix
    ./qemu.nix
    ./udisks2.nix
  ];
}
