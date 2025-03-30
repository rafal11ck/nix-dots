{
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
    systemd = {
      # false as it conflucts with uwsm
      enable = false;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
  };

}
