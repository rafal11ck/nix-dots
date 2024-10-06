{
  config,
  lib,
  pkgs,
  ...
}:

let
  values = config.values;
in
{

  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.catppuccin.catppuccin-vsc
      vscode-extensions.catppuccin.catppuccin-vsc-icons
      vscode-extensions.vscodevim.vim
      vscode-extensions.dbaeumer.vscode-eslint
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.jebbs.plantuml
      vscode-extensions.redhat.ansible
    ];
    #   mutableExtensionsDir = true;
    userSettings = {
      "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
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

    };
  };
}
