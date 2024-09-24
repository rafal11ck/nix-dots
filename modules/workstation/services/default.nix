{ config, lib, pkgs, ... }:

{
  imports = [
    ./dictd.nix
    ./qemu.nix
  ];
}
