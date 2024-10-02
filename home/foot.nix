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

    settings = {

      main = {
        font = "FiraCode Nerd Font Mono:size=14";
        dpi-aware = "yes";
      };

      colors = {
        alpha = 0.7;
      };
    };
  };

  xdg.configFile."foot" = {
    enable = false;
    recursive = true;
    source = "${config.values.dotfilesPath}" + "/foot/.config/foot";
  };

  home.packages = with pkgs; [
    fira-code-nerdfont
  ];
}
