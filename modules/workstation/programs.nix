{
  config,
  inputs,
  pkgs,
  flakePkgs,
  ...
}:
{
  programs = {
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };

    ssh = {
      startAgent = true;
    };

    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      flake = "/home/${config.values.mainUser}/nix-dots";
    };
    kdeconnect.enable = true;
    openvpn3 = {
      enable = true;
      package = flakePkgs.nixpkgs-stable.openvpn3;
    };
  };
}
