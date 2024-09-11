{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config) values;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # Those are made with mkDefault so that if this home manager works standalone 
  # but nixos won't error of duplicate.
  # This config is for home not system so it has lower piriorty.

  home =
    let
      username = "${values.mainUser}";
    in
    {
      inherit username;
      homeDirectory = lib.mkDefault "/home/${username}";

      stateVersion = lib.mkDefault "24.05"; # Please read the comment before changing.

      # The home.packages option allows you to install Nix packages into your
      # environment.
      packages = [
        # # Adds the 'hello' command to your environment. It prints a friendly
        # # "Hello, world!" when run.
        pkgs.hello
        pkgs.git
        pkgs.neovim
        pkgs.gitui
        pkgs.tree
        pkgs.cowsay
      ];
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
