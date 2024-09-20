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
}
