{
  config,
  ...
}:
{
  programs.aria2.enable = true;

  xdg.configFile."aria2" = {
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/aria2/.config/aria2/";
  };
}
