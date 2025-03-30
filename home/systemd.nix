{
  systemd.user.targets = {
    # HACK Fix services depending on tray.traget
    # https://github.com/nix-community/home-manager/issues/6329#issuecomment-2598736548
    # workaround https://github.com/nix-community/home-manager/issues/6329
    tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };
}
