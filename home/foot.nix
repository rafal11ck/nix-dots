{
  config,
  lib,
  pkgs,
  ...
}:
let
  conffile = ../dotfiles/foot/.config/foot/foot.ini;
in
{
  programs.foot = {
    enable = true;
    server = {
      enable = true;
    };
  };

  xdg.configFile."foot/foot.ini".source = conffile;
}
