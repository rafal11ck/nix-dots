{
  config,
  pkgs,
  lib,
  ...
}:
let
  username = "${config.values.mainUser}";

  # Function taking module list where it puts config
  configImport =
    dirs:
    builtins.listToAttrs (
      map (dir: {
        name = dir;
        value = {
          source = ../dotfiles/${dir}/.config/${dir};
          recursive = true;
        };
      }) dirs
    );
in
{
  imports = [
    # ./hello.nix
    ./bat.nix
    ./foot.nix
    ./git.nix
    ./gitui.nix
    ./neovim.nix
    ./tree.nix
    ./hyprland
  ];

  xdg.configFile = configImport [ "foot" "hypr" ];

  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    # Those are made with mkDefault so that if this home manager works standalone
    # but nixos won't error of duplicate.
    # This config is for home not system so it has lower piriorty.

    inherit username;
    homeDirectory = lib.mkDefault "/home/${username}";

    stateVersion = lib.mkDefault "24.05"; # Please read the comment before changing.

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
