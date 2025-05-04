{
  config,
  ...
}:
let
  cephfsMountGen = path: {
    device = "192.168.0.55:6789,192.168.0.56:6789,192.168.0.57:6789:${path}";
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
in
{
  fileSystems = {
    "/media/cephfs/ext" = cephfsMountGen "/ext";
    "/media/cephfs/volumes" = cephfsMountGen "/volumes";
  };
}
