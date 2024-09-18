{
  config,
  lib,
  pkgs,
  ...
}:

let
  curTheme = "phinger-cursors-light";
in
{
  home.pointerCursor = {
    name = "${curTheme}";
    size = 32;
    package = pkgs.phinger-cursors;
    gtk.enable = true;
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      cursor-theme = "${curTheme}";
    };
  };

}
