{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.plantuml-server = {
    enable = true;
    listenPort = 9123; 
  };

  imports = [
    ./blueman.nix
    ./davfs2.nix
    ./dictd.nix
    ./docker.nix
    ./gvfs.nix
    ./libvirtd.nix
    ./network-manager.nix
    ./udisks2.nix
  ];
}
