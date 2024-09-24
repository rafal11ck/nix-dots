{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Required for DDC/CI to work
  hardware.i2c.enable = true;
}
