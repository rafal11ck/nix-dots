{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.hypridle.enable = true;

  xdg.configFile."hypr/hypridle.conf" = {
    source = "${config.values.dotfilesPath}" + "/hypr/.config/hypr/hypridle.conf";
  };

}
