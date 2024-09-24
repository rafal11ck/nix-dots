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
    ./dict.nix
    ./dockfmt.nix
    ./emacs.nix
    ./fd.nix
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./gitui.nix
    ./hunspell.nix
    ./megatools
    ./mpv.nix
    ./ncdu.nix
    ./neovim.nix
    ./nh.nix
    ./nil.nix
    ./nmap.nix
    ./ripgrep.nix
    ./shellcheck.nix
    ./shfmt.nix
    ./starship.nix
    ./tree.nix
    ./zellij.nix
  ];

}
