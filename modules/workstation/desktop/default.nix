{
  imports = [
    ./pipewire.nix
    ./utils.nix
  ];

  services = {
    gnome.sushi.enable = true;
    tumbler.enable = true;
  };

  programs = {
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

}
