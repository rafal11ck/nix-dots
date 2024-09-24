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
      "audio"
      "i2c"
      "input"
      "wheel"
      "storage"
    ];
  };

}
