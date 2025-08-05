{
  config,
  lib,
  pkgs,
  inputs,
  window_manager,
  ...
}:
let
  quickshellPackage = inputs.caelestia-shell.packages.${pkgs.system}.caelestia-shell;
in
{
  systemd.user = {

    targets = {
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

    services = {
      quickshell = {
        Unit = {
          Description = "QuickShell Application";
          After = [ "graphical-session.target" ];
          Requires = [ "graphical-session.target" ];
        };

        Service = {
          Type = "simple";
          ExecStart = "${quickshellPackage}/bin/caelestia-shell";
          ExecStartPre = "/bin/sh -c 'test -n \"$WAYLAND_DISPLAY\"'";
          Restart = "always";
          RestartSec = "5s";
        };

        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };
    };
  };

}
