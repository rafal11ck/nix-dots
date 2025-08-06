{

  qt = {
    enable = false;

    platformTheme.name = "qt5ct";
    # style = {
    #   name = "kvantum";
    # };

  };

  #xdg.configFile = {
  #  "Kvantum/kvantum.kvconfig".text = ''
  #    [General]
  #   theme=Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}
  # '';

  # # The important bit is here, links the theme directory from the package to a directory under `~/.config`
  # # where Kvantum should find it.
  # "Kvantum/Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}".source = "${kvantumThemePackage}/share/Kvantum/Catppuccin-${values.catppuccinFlavor}-${values.catppuccinAccent}";
  #};

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "Fusion";
  };
}
