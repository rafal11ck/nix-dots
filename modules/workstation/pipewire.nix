{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.pipewire = {
    enable = true;
    socketActivation = true;
    systemWide = true;
    pulse = {
      enable = true;
    };
    jack = {
      enable = true;
    };
  };
}
