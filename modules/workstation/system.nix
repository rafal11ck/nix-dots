{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.${config.values.mainUser} = {
    isNormalUser = true;
    extraGroups = [
      "audio"
      "i2c"
      "input"
      "wheel"
      "storage"
      "davfs2"
      "libvirtd"
      "docker"
    ];
  };

}
