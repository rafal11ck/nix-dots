{
  config,
  lib,
  pkgs,
  ...
}:
let
  userScriptsDir = "scripts/path";
in
{

  # Add scripts dir to PATH.
  home.sessionPath = [ (config.xdg.configHome + "/${userScriptsDir}") ];

  home.packages = with pkgs; [
    ddcutil # for displaybrightness scripts
  ];

  # scripts dir
  xdg.configFile."${userScriptsDir}" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/scripts/.config/scripts/path";
  };
}
