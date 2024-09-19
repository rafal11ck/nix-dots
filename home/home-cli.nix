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

    ./style

    ./aria2.nix
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./emacs.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./nh.nix
    ./starship.nix
    ./tree.nix
    ./zellij.nix
  ];

}
