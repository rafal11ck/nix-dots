{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.mpv = {
    enable = true;
  };

  xdg.configFile."mpv" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/mpv/.config/mpv";
  };

}
