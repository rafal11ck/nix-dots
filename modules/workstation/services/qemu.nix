{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment = {
    systemPackages = [ pkgs.qemu ];
  };
}
