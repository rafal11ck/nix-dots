{
  config,
  lib,
  pkgs,
  ...
}:

{
  gtk = {
    enable = true;
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
      name = "ePapirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Pop-dark";
      color-scheme = "prefer-dark";
    };
  };

}
