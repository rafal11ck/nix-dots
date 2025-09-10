{
  pkgs,
  ...
}:
{
  fonts = {

    # fontDir.enable = true;

    packages = with pkgs; [
      font-awesome
      nerd-fonts.droid-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.roboto-mono
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
      noto-fonts-lgc-plus

    ];
  };
}
