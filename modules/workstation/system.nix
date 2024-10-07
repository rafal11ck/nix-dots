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
      "davfs2"
      "docker"
      "i2c"
      "input"
      "libvirtd"
      "networkmanager"
      "power"
      "storage"
      "video"
      "wheel"
    ];
  };

  programs.nix-ld = {
    enable = true;
  };
}
