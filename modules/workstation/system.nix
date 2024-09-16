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
      "wheel"
      "input"
      "audio"
    ];
  };
}
