{
  pkgs,
  hyprland,
  config,
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
      enable = true;
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

  xdg.configFile."hypr/appsworkspaces.conf".source =
    "${config.values.dotfilesPath}" + "/hypr/.config/hypr/appsworkspaces.conf";
  xdg.configFile."hypr/hyprland.conf".source =
    "${config.values.dotfilesPath}" + "/hypr/.config/hypr/hyprland.conf";
  xdg.configFile."hypr/keybinds.conf".source =
    "${config.values.dotfilesPath}" + "/hypr/.config/hypr/keybinds.conf";
  xdg.configFile."hypr/env.conf".source =
    "${config.values.dotfilesPath}" + "/hypr/.config/hypr/env.conf";
  xdg.configFile."hypr/autorun.conf".source =
    "${config.values.dotfilesPath}" + "/hypr/.config/hypr/autorun.conf";
}
