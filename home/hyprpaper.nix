{
  config,
  lib,
  pkgs,
  ...
}:

{

  services.hyprpaper.enable = true;

  xdg.configFile."hypr/hyprpaper.conf" = {
    source = "${config.values.dotfilesPath}" + ".config/hypr/hyprpaper.conf";
  };
}
