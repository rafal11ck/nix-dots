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
      "adbusers"
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

  networking.firewall.allowedTCPPorts = [ 8081 ];
}
