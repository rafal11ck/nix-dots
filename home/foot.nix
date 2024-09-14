{
  config
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
    source = "${config.values.dotfilesPath}" + "/foot/.config/foot/";
  };
}
