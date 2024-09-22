{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    jellyfin-mpv-shim
  ];

  xdg.configFile."scripts/jellyfin-mpv-shim-config-chose.sh" = {
    source =
      "${config.values.dotfilesPath}" + "/scripts/.config/scripts/" + "jellyfin-mpv-shim-config-chose.sh";
  };

  xdg.configFile."jellyfin-mpv-shim/mpv.conf" = {
    source = "${config.values.dotfilesPath}" + "/jellyfin-mpv-shim/.config/jellyfin-mpv-shim/mpv.conf";
  };

  home.sessionPath = [ (config.xdg.configHome + "/scripts") ];
}
