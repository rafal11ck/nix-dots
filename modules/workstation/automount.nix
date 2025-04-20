{
  config,
  ...
}:
{
  fileSystems = {
    # NOTE requires setup in /etc/ceph
    "/media/ext" = {
      device = "192.168.0.55:6789,192.168.0.56:6789,192.168.0.57:6789:/ext";
      fsType = "ceph";
      options = [
        "x-systemd.automount"
        "x-systemd.idle-timeout=300"
        "noauto"
        "_netdev"
        "fs=ceph-filesystem"
        "name=${config.networking.hostName}"
        "noatime"
      ];
    };

  };
}
