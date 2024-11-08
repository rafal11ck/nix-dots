{
  config,
  lib,
  pkgs,
  ...
}:

{
  services = {
    logind.lidSwitchExternalPower = "ignore";

    blueman.enable = true;
    plantuml-server = {
      enable = true;
      listenPort = 9123;
    };
    udev.packages = [
      pkgs.android-udev-rules
    ];
    udisks2.enable = true;
    dictd.enable = true;
    davfs2.enable = true;
    gvfs.enable = true;

    resolved.enable = true;
    avahi.enable = true;
  };

  imports = [
    ./docker.nix
    ./libvirtd.nix
    ./networking.nix
  ];
}
