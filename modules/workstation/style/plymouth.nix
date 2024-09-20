{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.plymouth.logo = pkgs.fetchurl {
    url = "https://nixos.org/logo/nixos-hires.png";
    sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
  };
}
