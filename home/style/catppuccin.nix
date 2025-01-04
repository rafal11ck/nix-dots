{
  config,
  lib,
  ...
}:
let
  values = config.values;
in
{
  catppuccin = {
    enable = true;
    accent = "${lib.strings.toLower values.catppuccinAccent}";
    flavor = "${lib.strings.toLower values.catppuccinFlavor}";
    zathura.enable = false;
    swaylock.enable = true;
    starship.enable = false;
    kvantum = {
      enable = true;
      flavor = lib.toLower "${values.catppuccinFlavor}";
      apply = true;
    };
    fzf.enable = false;
    cursors.enable = true;
  };
}
