{ config, lib, pkgs, ... }:

{
  imports = [
    ./dictd.nix
    ./gvfs.nix
    ./qemu.nix
    ./udisks2.nix
  ];
}
