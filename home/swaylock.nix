{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.swaylock.enable = true;

  programs.swaylock.catppuccin.enable = true;

  #xdg.configFile."swaylock" = {
  #  recursive = true;
  #  source = "${config.values.dotfilesPath}" + "/swaylock/.config/swaylock";
  #};
}
