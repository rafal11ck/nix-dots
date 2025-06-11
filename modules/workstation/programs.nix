{
  config,
  ...
}:
{
  programs = {
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };

    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      flake = "/home/${config.values.mainUser}/nix-dots";
    };
    kdeconnect.enable = true;
  };
}
