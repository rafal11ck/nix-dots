{
  config,
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
    source = "${config.values.dotfilesPath}" + "/foot/.config/foot";
  };

  home.packages = with pkgs; [
    fira-code-nerdfont
  ];
}
