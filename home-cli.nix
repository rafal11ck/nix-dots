{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

  #xdg.configFile = configImport [ "foot" ];
}
