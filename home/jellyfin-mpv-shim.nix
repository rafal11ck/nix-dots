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

  xdg.configFile."jellyfin-mpv-shim/mpv.conf" = {
    source = "${config.values.dotfilesPath}" + "/jellyfin-mpv-shim/.config/jellyfin-mpv-shim/mpv.conf";
  };

  xdg.configFile."jellyfin-mpv-shim/conf.json" = {
    source = "${config.values.dotfilesPath}" + "/jellyfin-mpv-shim/.config/jellyfin-mpv-shim/conf.conf";
  };

}
