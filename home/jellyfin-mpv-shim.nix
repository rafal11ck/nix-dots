{
  config,
  lib,
  pkgs,
  ...
}:

let
  scriptName = "jellyfin-mpv-shim-config-chose.sh";
in
{
  home.packages = with pkgs; [
    jellyfin-mpv-shim
  ];

  xdg.configFile."scripts/${scriptName}" = {
    source = "${config.values.dotfilesPath}" + "/scripts/.config/scripts/" + "${scriptName}";
  };

  home.sessionPath = [ (config.xdg.configHome + "/scripts") ];
}
