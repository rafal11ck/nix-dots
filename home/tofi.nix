{ config, lib, pkgs, ... }:

{
  programs.tofi = {
    enable = true;
  };

  xdg.configFile."tofi" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/tofi/.config/tofi";
  };
}
