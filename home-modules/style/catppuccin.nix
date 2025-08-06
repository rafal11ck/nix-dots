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
    accent = "${lib.strings.toLower values.catppuccinAccent}";
    flavor = "${lib.strings.toLower values.catppuccinFlavor}";
    kvantum = {
      enable = false;
      flavor = lib.toLower "${values.catppuccinFlavor}";
      apply = true;
    };
    fzf.enable = false;
    cursors.enable = true;
  };
}
