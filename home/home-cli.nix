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

    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

}
