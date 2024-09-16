{
  config,
  pkgs,
  ...
}:

{
  services.swaync = {
    enable = true;
  };

  xdg.configFile."swaync" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/swaync/.config/swaync";
  };

  xdg.configFile."scripts/nightmode.sh" = {
    source = "${config.values.dotfilesPath}" + "/scripts/.config/scripts/nightmode.sh";
  };

}
