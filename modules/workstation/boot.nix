{
  boot.loader.grub = {
    devices = [ "nodev" ];
    configurationLimit = 4;
    efiSupport = true;
    enable = true;
    useOSProber = true;
  };
}
