{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emojify

    python3
    nixfmt-rfc-style # for nix mode in emacs
    bash-language-server # for sh mode lsp
    nodePackages_latest.vscode-json-languageserver # lsp server for json

    # nerdfonts # NOTE: idk if it will solve fonts.
  ];

  programs.emacs.enable = true;
  services.emacs.enable = true;

  # Doom emacs has to be installed manualy
  #
  # git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  # ~/.config/emacs/bin/doom install
  #
  # Remove regural emacs config
  # rm ~/.config/.emacs.d
  #
  xdg.configFile."doom" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/doom/.config/doom/";
  };

  home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
}
