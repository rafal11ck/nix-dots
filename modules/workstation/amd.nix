{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.amdgpu.initrd.enable = lib.mkDefault true;
}
