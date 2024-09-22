{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Add scripts dir to PATH.
  home.sessionPath = [ (config.xdg.configHome + "/scripts/path") ];

  home.packages = with pkgs; [
    ddcutil # for displaybrightness scripts
  ];

  # scripts dir
  xdg.configFile."scripts" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/scripts/.config/scripts";
  };
}
