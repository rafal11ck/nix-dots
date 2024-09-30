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
    ./docker.nix
    ./gvfs.nix
    ./libvirtd.nix
    ./udisks2.nix
  ];
}
