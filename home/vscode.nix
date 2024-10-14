{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  values = config.values;
  vs-extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{

  programs.vscode = {
    enable = true;
    # To look for extension names: https://github.com/nix-community/nix-vscode-extensions?tab=readme-ov-file#explore
    extensions = with vs-extensions.vscode-marketplace; [
      pkgs.vscode-extensions.jnoortheen.nix-ide
      catppuccin.catppuccin-vsc-icons
      vscodevim.vim
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      jebbs.plantuml
      redhat.ansible
    ];
    #   mutableExtensionsDir = true;
    userSettings = {
      "extensions.autoUpdate" = false;
      "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

      "alt-catppuccin.accentColor" = lib.toLower values.catppuccinAccent;
      "files.refactoring.autoSave" = true;

      "editor.formatOnSave" = true;

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "terminal.integrated.fontFamily" = "Fira Code Nerd Mono";

      "telemetry.telemetryLevel" = "off";
      "nix.serverSettings" = {
        nil = {
          formatting = {
            command = [ "nixfmt" ];
          };
        };
      };

      "editor.lineNumbers" = "relative";

      "prettier.singleQuote" = true;
      "workbench.colorTheme" = "Catppuccin ${values.catppuccinFlavor}";
      "workbench.iconTheme" = "catppuccin-${lib.toLower values.catppuccinFlavor}";

      "vim.handleKeys" = {
        "<C-p>" = false;
      };

      "vim.useSystemClipboard" = true;
      "files.autoSave" = "afterDelay";
      "plantuml.render" = "PlantUMLServer";
      "plantuml.server" = "http://127.0.0.1:9123/plantuml"; # NOTE this relyies on local plantuml server (set in workstation module)
    };
  };
}
