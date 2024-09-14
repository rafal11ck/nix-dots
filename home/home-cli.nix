{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkOption types;

  options.values = {
    dotfilesPath = mkOption {
      description = "Path to dotfiles directory from home directory of configuration";
      type = types.str;
      default = "../dotfiles/";
    };
  };
in
{

  imports = [
 #   ./values.nix
    ./shared.nix

    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

}
