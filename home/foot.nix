{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.foot = {
    enable = true;
    server = {
      enable = true;
    };
  };

  xdg.configFile."foot" = {
    recursive = true;
    source = "${config.values.dotfielsPath}" + "/foot";
  };
}
