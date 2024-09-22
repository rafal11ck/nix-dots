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


  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
