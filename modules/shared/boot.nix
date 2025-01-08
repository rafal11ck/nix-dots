{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = lib.mkDefault true;
    };
    tmp.useTmpfs = true;
  };

}
