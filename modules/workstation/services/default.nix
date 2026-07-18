{
  pkgs,
  ...
}:

{

  services = {
    logind.settings.Login = {
      HandleLidSwitchExternalPower = "ignore";
      HandlePowerKey = "suspend";
    };
    power-profiles-daemon.enable = true;

    plantuml-server = {
      enable = true;
      listenPort = 9123;
    };

    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      package = pkgs.openrgb-with-all-plugins;
    };

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

  };

  # OpenRGB effects (audio visualizer) run in the GUI, autostarted per-user
  # (see home-modules/hyprland/openrgb.nix). Disable the headless server so two
  # instances don't fight over the same controller.
  systemd.services.openrgb.enable = false;

  imports = [
    ./libvirtd.nix
    ./networking.nix
    ./pipewire.nix
  ];
}
