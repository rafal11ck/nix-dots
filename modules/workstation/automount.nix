{
  config,
  lib,
  pkgs,
  ...
}:

{

  # NOTE requires credentials to be provided (man mount.davfs)
  systemd = {
    mounts = [
      {
        what = "https://cloud.cursedman.xyz/remote.php/dav/files/rafal/safe";
        where = "/home/${config.values.mainUser}/remote/safe";
        type = "davfs";
        options = "uid=${config.values.mainUser},noauto,user,_netdev";
      }
    ];

    automounts = [
      {
        description = "Automount safe";
        where = "/home/${config.values.mainUser}/remote/safe";
        automountConfig = {
          TimeoutIdleSec = 60;
        };
      }
    ];
  };
}
