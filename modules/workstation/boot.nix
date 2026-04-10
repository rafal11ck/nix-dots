{
  lib,
  ...
}:
{
  # disable default from shared.
  boot.loader.systemd-boot.enable = lib.mkForce false;


  boot.loader.grub = {
    #copyKernels = true;
    devices = [ "nodev" ];
    configurationLimit = 4;
    efiSupport = true;
    enable = true;
    useOSProber = true;
  };

}
