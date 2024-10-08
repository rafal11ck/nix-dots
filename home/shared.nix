{
  config,
  lib,
  pkgs,
  ...
}:

let
  username = "${config.values.mainUser}";
in
{
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
