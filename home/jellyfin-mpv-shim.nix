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
}
