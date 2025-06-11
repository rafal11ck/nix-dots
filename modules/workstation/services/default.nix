{
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
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        gutenprintBin
        brlaser
      ];
    };

    gnome.sushi.enable = true;
    tumbler.enable = true;

  };

  imports = [
    ./libvirtd.nix
    ./networking.nix
    ./pipewire.nix
  ];
}
