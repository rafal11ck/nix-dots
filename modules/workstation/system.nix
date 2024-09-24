{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    davfs2
  ];

  users.users.${config.values.mainUser} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "audio"
      "i2c"
    ];
  };

}
