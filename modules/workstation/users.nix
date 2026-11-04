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
        "audio"
        "davfs2"
        "docker"
        "i2c"
        "input"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
        "gamemode"
      ];
    };
  };

  environment.etc.hosts.mode = "0644";
}
