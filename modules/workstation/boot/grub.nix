{
  config,
  lib,
  pkgs,
  ...
}:

{
  # disable default from shared.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;

  boot.loader.grub = {
    copyKernels = true;
    devices = [ "nodev" ];
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
    useOSProber = true;
  };
}
