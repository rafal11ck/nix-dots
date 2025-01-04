{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."starship.toml" = {
    source = "${config.values.dotfilesPath}" + "/starship/.config/starship.toml";
  };
}
