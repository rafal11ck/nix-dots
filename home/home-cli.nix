{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./values.nix

    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
  ];

}
