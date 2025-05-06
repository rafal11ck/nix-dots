{
  config,
  lib,
  pkgs,
  ...
}:
{
  home =
    let
      username = "${config.values.mainUser}";
    in
    {

      activation = {
        prismlauncher-fix =
          let
            prismAccontFilePath = "$HOME/.local/share/PrismLauncher/accounts.json";
          in
          lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            # fix prism launcher 
            [ -f ${prismAccontFilePath} ] &&
            run ${pkgs.jaq}/bin/jaq -i '
              .accounts += (
                if any(.accounts[]; (.type == "MSA" and has("entitlement"))) then
                  []
                else
                  [{
                    entitlement: {
                      canPlayMinecraft: true,
                      ownsMinecraft: true
                    },
                    type: "MSA"
                  }]
                end
              )
              ' ${prismAccontFilePath} 
          '';
      };

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

      stateVersion = lib.mkDefault "24.05"; # Please read the comment before changing.
    };
}
