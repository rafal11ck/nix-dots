{
  config,
  ...
}:
let
  values = config.values;
in
{
  imports = [
    ./firefox.nix
    ./vscode.nix
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    bash = {
      enable = true;
      bashrcExtra = ''
        alias k=kubectl

        # Source all scripts in ~/.bashrc.d/
        if [ -d "$HOME/.bashrc.d" ]; then
            for script in "$HOME/.bashrc.d/"*; do
                if [ -f "$script" ] && [ -r "$script" ]; then
                    source "$script"
                fi
            done
        fi
      '';
    };
    bat.enable = true;
    btop = {
      enable = true;
    };
    direnv = {
      enable = true;
    };
    fd = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    k9s = {
      enable = true;
    };
    lsd = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
    gitui = {
      enable = true;
    };
    git = {
      enable = true;

      settings = {
        user = {
          name = "${values.mainUser}";
          email = "you@example.com";

        };

        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
        fetch = {
          prune = true;
        };
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };

    foot = {
      enable = true;
      server = {
        enable = true;
      };
    };
    obs-studio = {
      enable = true;
    };

  };
}
