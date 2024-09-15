{ config, ... }:
{
  programs.emacs.enable = true;

  # Doom emacs has to be installed manualy
  #
  # git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  # ~/.config/emacs/bin/doom install
  #
  xdg.configFile."doom" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/doom/.config/doom/";
  };

  home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
}
