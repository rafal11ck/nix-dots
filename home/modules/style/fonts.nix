{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    zlib # HACK https://github.com/nix-community/home-manager/issues/703 in standalone hm
    font-awesome
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    noto-fonts-cjk-sans
    noto-fonts-lgc-plus
    nerd-fonts.roboto-mono
  ];
}
