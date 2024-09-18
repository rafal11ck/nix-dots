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
    iosevka-bin
    font-awesome
    material-design-icons

    # nightmode script dependency
    gammastep
  ];

  xdg.configFile."waybar" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/waybar/.config/waybar";
  };

  xdg.configFile."scripts/nightmode.sh" = {
    source = "${config.values.dotfilesPath}" + "/scripts/.config/scripts/" + "nightmode.sh";
  };

  home.sessionPath = [ (config.xdg.configHome + "/scripts") ];
}
