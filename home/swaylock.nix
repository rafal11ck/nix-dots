{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Note that PAM must be configured to enable swaylock to perform authentication
  programs.swaylock.enable = true;

  programs.swaylock.catppuccin.enable = true;

  #xdg.configFile."swaylock" = {
  #  recursive = true;
  #  source = "${config.values.dotfilesPath}" + "/swaylock/.config/swaylock";
  #};
}
