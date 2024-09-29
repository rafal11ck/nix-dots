{
  config,
  lib,
  pkgs,
  ...
}:

{
  # NOTE requires credentials to be provided (man mount.davfs)
  systemd =
    let
      davpath = "/media/safe";
    in
    {
      mounts = [
        {
          what = "https://cloud.cursedman.xyz/remote.php/dav/files/rafal/safe";
          where = davpath;
          type = "davfs";
          options = "uid=${config.values.mainUser},noauto,user,_netdev";
        }
      ];

      automounts = [
        {
          description = "Automount safe";
          where = davpath;
          automountConfig = {
            TimeoutIdleSec = 60;
          };
        }
      ];
    };
}
