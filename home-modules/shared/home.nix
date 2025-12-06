{
  config,
  lib,
  ...
}:
{
  home =
    let
      username = "${config.values.mainUser}";
    in
    {

      # Home Manager needs a bit of information about you and the paths it should
      # manage.
      # Those are made with mkDefault so that if this home manager works standalone
      # but nixos won't error of duplicate.
      # This config is for home not system so it has lower piriorty.

      inherit username;
      homeDirectory = lib.mkDefault "/home/${username}";

      sessionVariables = {
        PATH = "$HOME/.config/scripts/path:\${KREW_ROOT-$HOME/.krew}/bin:$PATH";
        VISUAL = "code";
        GIT_EDITOR = "nvim";
        EDITOR = "nvim";
        # extraInit = ''
        # source ~/.profile
        # '';
      };

      stateVersion = lib.mkDefault "25.11"; # Please read the comment before changing.
    };
}
