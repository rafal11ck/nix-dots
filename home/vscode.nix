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
      bierner.markdown-mermaid
      bpruitt-goddard.mermaid-markdown-syntax-highlighting
      catppuccin.catppuccin-vsc-icons
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      jebbs.plantuml
      ms-python.debugpy
      ms-python.isort
      ms-python.pylint
      ms-python.python
      pkgs.vscode-extensions.jnoortheen.nix-ide
      redhat.ansible
      redhat.vscode-yaml
      vscodevim.vim
      dsznajder.es7-react-js-snippets
      usernamehw.errorlens
      tomoki1207.pdf
      ms-kubernetes-tools.vscode-kubernetes-tools
      mechatroner.rainbow-csv
    ];
    #   mutableExtensionsDir = true;
    userSettings = {
      "extensions.autoUpdate" = false;
      "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[yaml]"."editor.defaultFormatter" = "redhat.vscode-yaml";
      "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[html]"."editor.defaultFormatter" = "vscode.html-language-features";

      "alt-catppuccin.accentColor" = lib.toLower values.catppuccinAccent;
      "files.refactoring.autoSave" = true;

      "editor.formatOnSave" = true;

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font Mono";

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
      "prettier.tabWidth" = 4;

      "workbench.colorTheme" = "Catppuccin ${values.catppuccinFlavor}";
      "workbench.iconTheme" = "catppuccin-${lib.toLower values.catppuccinFlavor}";

      "vim.handleKeys" =
        let
          binds = [
            "<C-a>"
            "<C-b>"
            "<C-f>"
            "<C-p>"
            "<C-k>"
          ];
        in
        builtins.listToAttrs (
          map (key: {
            name = key;
            value = false;
          }) binds
        );

      "vim.useSystemClipboard" = true;
      "files.autoSave" = "afterDelay";
      "plantuml.render" = "PlantUMLServer";
      "plantuml.server" = "http://127.0.0.1:9123/plantuml"; # NOTE this relyies on local plantuml server (set in workstation module)
      "explorer.confirmDelete" = false;
    };
  };
}
