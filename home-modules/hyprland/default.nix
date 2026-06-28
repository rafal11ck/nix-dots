{
  inputs,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    #for screenshots
    swappy
    grim
    slurp

    killall
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    systemd = {
      # false as it conflucts with uwsm
      enable = false;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
  };

  imports = [
    ./tofi.nix
    ./services.nix
  ];
}
