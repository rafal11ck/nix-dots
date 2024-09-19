{
  inputs,
  lib,
  config,
  ...
}:

let
  values = config.values;
in
{

  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    accent = "${lib.strings.toLower values.catppuccinAccent}";
    flavor = "${lib.strings.toLower values.catppuccinFlavor}";
  };
}
