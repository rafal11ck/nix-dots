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
    # extensions names should be lowercase
    #
    # Extensions that are in nixpkgs (and not work from vs-extensions) should be taken from nixpkgs
    #
    extensions = with vs-extensions.vscode-marketplace; [
      james-yu.latex-workshop
      bierner.markdown-mermaid
      bpruitt-goddard.mermaid-markdown-syntax-highlighting
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      jebbs.plantuml
      ms-python.debugpy
      ms-python.isort
      ms-python.pylint
      ms-python.python
      pkgs.vscode-extensions.jnoortheen.nix-ide
      redhat.vscode-yaml
      vscodevim.vim
      dsznajder.es7-react-js-snippets
      usernamehw.errorlens
      tomoki1207.pdf
      ms-kubernetes-tools.vscode-kubernetes-tools
      mechatroner.rainbow-csv
      naumovs.color-highlight
      ms-vscode-remote.remote-containers
      jock.svg
      mkhl.direnv
      waderyan.gitblame
      pkgs.vscode-extensions.ms-vscode.cpptools
      ms-vscode.cmake-tools
      gruntfuggly.todo-tree
      albert.tabout
      britesnow.vscode-toggle-quotes
      mitchdenny.ecdc
      fcrespo82.markdown-table-formatter
      signageos.signageos-vscode-sops
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
      "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

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
      "latex-workshop.formatting.latex" = "latexindent";
      # "latex-workshop.intellisense.update.aggressive.enabled" = false;
      "latex-workshop.check.duplicatedLabels.enabled" = true;
      "latex-workshop.latex.autoClean.run" = "onFailed";
      "vim.disableExtension" = true;
      "cmake.pinnedCommands" = [
        "workbench.action.tasks.configureTaskRunner"
        "workbench.action.tasks.runTask"
      ];
      "cmake.showOptionsMovedNotification" = false;
    };
  };
}
