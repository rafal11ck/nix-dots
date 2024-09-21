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
    ./clang.nix
    ./dockfmt.nix
    ./emacs.nix
    ./fd.nix
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./gitui.nix
    ./hunspell.nix
    ./mpv.nix
    ./neovim.nix
    ./nh.nix
    ./ripgrep.nix
    ./shellcheck.nix
    ./shfmt.nix
    ./starship.nix
    ./tree.nix
    ./zellij.nix
  ];

}
