{
  config,
  lib,
  pkgs,
  ...
}:

{

  home.packages = [ pkgs.pop-gtk-theme ];

  gtk = {
    enable = false;
    theme = {
      name = "Pop-dark";
      package = pkgs.pop-gtk-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = (
        pkgs.papirus-icon-theme.override {
          color = (lib.strings.toLower config.values.catppuccinAccent);
        }
      );
    };
  };

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     gtk-theme = "Pop-dark";
  #     color-scheme = "prefer-dark";
  #     iconTheme = "Papirus-Dark";
  #   };
  # };

}
