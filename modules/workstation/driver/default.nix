{
  imports = [
    ./i2c.nix
  ];

  hardware = {
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
  };

}
