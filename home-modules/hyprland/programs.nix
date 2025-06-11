{
  programs = {
    waybar = {
      enable = true;
      systemd = {
        # workaround https://github.com/nix-community/home-manager/issues/5927
        # Starting waybar from WM directly
        enable = true;
      };
    };
  };
}
