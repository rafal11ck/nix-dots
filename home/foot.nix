{
  config,
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
    enable = true;
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/foot/.config/foot";
  };
}
