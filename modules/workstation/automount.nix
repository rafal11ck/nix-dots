{
  config,
  lib,
  pkgs,
  ...
}:
let
  values = config.values;
in
{

  fileSystems = {

    # NOTE requires credentials to be provided (man mount.davfs)
    "/media/safe" = {
      device = "https://cloud.cursedman.xyz/remote.php/dav/files/rafal/safe";
      fsType = "davfs";
      options = [
        "x-systemd.automount"
        "x-systemd.idle-timeout=60"
        "user"
        "uid=${values.mainUser}"
        "noauto"
        "_netdev"
      ];
    };

    # NOTE requires credentials to be provided (man mount.cifs)
    "/media/ext" = {
      device = "//openmediavault/ext";
      fsType = "cifs";
      options = [
        "_netdev"
        "credentials=/etc/samba/credentials"
        "exec"
        "noauto"
        "nobrl"
        "uid=${values.mainUser}"
        "user"
        "vers=3.0"
        "x-systemd.automount"
        "x-systemd.idle-timeout=300"
      ];
    };

  };
}
