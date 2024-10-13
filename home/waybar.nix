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

      # workaround https://github.com/nix-community/home-manager/issues/5927
      # Starting waybar from WM directly
      #enable = true;
    };
  };

  home.packages = with pkgs; [
    iosevka
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
}
