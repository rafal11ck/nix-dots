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

    catppuccin.enable = lib.mkDefault false;
  };

  xdg.configFile."starship.toml" = {
    source = "${config.values.dotfilesPath}" + "/starship/.config/starship.toml";
  };
}
