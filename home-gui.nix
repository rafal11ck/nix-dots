{
  config,
  lib,
  pkgs,
  configImport,
}:

{
  imports = [
    #values !
    ./values.nix

    ./hyprland
  ];

}
