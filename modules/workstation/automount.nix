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
        "rw"
        "credentials=/etc/samba/credentials"
        "exec"
        "noatime"
        "noauto"
        "nobrl"
        "uid=${values.mainUser}"
        "vers=3.0"
        "x-systemd.automount"
        "x-systemd.idle-timeout=300"
      ];
    };

  };
}
