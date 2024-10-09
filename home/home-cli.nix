{
  pkgs,
  ...
}:
{
  imports = [
    ./values.nix
    ./shared.nix

    ./style

    ./ansible.nix
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
    ./megatools.nix
    ./mpv.nix
    ./ncdu.nix
    ./neovim.nix
    ./nh.nix
    ./nil.nix
    ./nmap.nix
    ./p7zip.nix
    ./pandoc.nix
    ./playerctl.nix
    ./pulsemixer.nix
    ./python.nix
    ./ranger.nix
    ./ripgrep.nix
    ./shellcheck.nix
    ./shfmt.nix
    ./starship.nix
    ./termdown.nix
    ./tree.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  home.packages = [
    pkgs.nix-output-monitor
    pkgs.qpdf
    pkgs.octaveFull
  ];
}
