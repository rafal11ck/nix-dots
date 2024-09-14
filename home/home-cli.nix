{
  config,
  lib,
  pkgs,
  configImport,
  ...
}:

{
  imports = [
    #values
    ./values.nix

    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

  xdg.configFile = configImport [ "foot" ];
}
