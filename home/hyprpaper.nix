{
  config,
  lib,
  pkgs,
  ...
}:

{

  services.hyprpaper.enable = true;

  xdg.configFile."hypr/hyprpaper.conf" = {
    source = "${config.values.dotfilesPath}" + "/hypr/.config/hypr/hyprpaper.conf";
  };
}
