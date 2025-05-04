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
      enableAliases = true;
    };
    ripgrep = {
      enable = true;
    };
    gitui = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "${values.mainUser}";
      userEmail = "you@example.com";

      extraConfig = {
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
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

    waybar = {
      enable = true;
      systemd = {
        # workaround https://github.com/nix-community/home-manager/issues/5927
        # Starting waybar from WM directly
        enable = true;
      };
    };
    foot = {
      enable = true;
      server = {
        enable = true;
      };
    };
    mpv = {
      enable = true;
    };
    obs-studio = {
      enable = true;
    };

  };
}
