{
  config,
  lib,
  pkgs,
  ...
}:
let
  values = config.values;

  kvantumThemePackage = pkgs.catppuccin-kvantum.override {
    accent = "${values.catppuccinAccent}";
    variant = "${values.catppuccinFlavor}";
  };
in
{
  # https://discourse.nixos.org/t/catppuccin-kvantum-not-working/43727/14
  home.packages =
    with pkgs;
    [
    ];

  qt = {
    enable = true;

    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
      catppuccin.enable = false;
    };

  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}
    '';

    # The important bit is here, links the theme directory from the package to a directory under `~/.config`
    # where Kvantum should find it.
    "Kvantum/Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}".source = "${kvantumThemePackage}/share/Kvantum/Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}";
  };

  home.sessionVariables = {
    #QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}
