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

  home.packages = with pkgs; [
    dejavu_fonts
    font-awesome
  ];

  xdg.configFile."waybar" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/waybar/.config/waybar";
  };
}
