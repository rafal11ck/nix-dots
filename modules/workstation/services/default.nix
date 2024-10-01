{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./blueman.nix
    ./davfs2.nix
    ./dictd.nix
    ./docker.nix
    ./gvfs.nix
    ./libvirtd.nix
    ./udisks2.nix
  ];
}
