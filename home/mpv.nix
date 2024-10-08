{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.mpv = {
    enable = true;

    #package = pkgs.svp.mpv;
  };

  xdg.configFile."mpv" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/mpv/.config/mpv";
  };

}
