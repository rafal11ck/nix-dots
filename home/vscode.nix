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
      vscode-extensions.dbaeumer.vscode-eslint
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.catppuccin.catppuccin-vsc
    ];
    mutableExtensionsDir = true;
    userSettings = {
      "files.refactoring.autoSave" = true;
      "alt-catppuccin.accentColor" = lib.toLower values.catppuccinAccent;
      "prettier.singleQuote" = true;
      "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.colorTheme" = "Catppuccin Mocha";
    };
  };
}
