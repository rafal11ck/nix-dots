{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
  };

  xdg.configFile."waybar" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/waybar/.config/waybar";
  };
}
