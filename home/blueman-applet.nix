{
  config,
  lib,
  pkgs,
  ...
}:

{
  # NOTE that for the applet to work, the blueman service should
  # be enabled system-wide. You can enable it in the system
  # configuration using
  # services.blueman.enable = true;
  services.blueman-applet.enable = true;
}
