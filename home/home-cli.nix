{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./values.nix
    ./shared.nix

    ./aria2.nix
    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

}
