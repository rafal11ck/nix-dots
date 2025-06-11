{
  config,
  ...
}:
let
  mainUser = config.values.mainUser;
in
{
  users = {
    groups.${mainUser} = { };

    users.${mainUser} = {
      group = mainUser;
      isNormalUser = true;
      extraGroups = [
        mainUser
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
  };

  # Make hosts mutable but cleaned on switch
  # https://discourse.nixos.org/t/a-fast-way-for-modifying-etc-hosts-using-networking-extrahosts/4190
  environment.etc.hosts.mode = "0644";
}
