{
  config,
  lib,
  pkgs,
  inputs,
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
  };
}
