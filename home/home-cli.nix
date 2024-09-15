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
    ./bash.nix
    ./bat.nix
    ./emacs.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./starship.nix
    ./tree.nix
  ];

}
