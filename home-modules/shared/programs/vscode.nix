{
  pkgs,
  inputs,
  ...
}:

let
  vs-extensions = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system};
in
{

  programs.vscode = {
    enable = true;
    # To look for extension names: https://github.com/nix-community/nix-vscode-extensions?tab=readme-ov-file#explore
    # extensions names should be lowercase
    #
    # Extensions that are in nixpkgs (and not work from vs-extensions) should be taken from nixpkgs
    #
    profiles.default.extensions = with vs-extensions.vscode-marketplace; [
      albert.tabout
      bierner.markdown-mermaid
      bpruitt-goddard.mermaid-markdown-syntax-highlighting
      britesnow.vscode-toggle-quotes
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      christian-kohler.path-intellisense
      csstools.postcss
      dbaeumer.vscode-eslint
      dsznajder.es7-react-js-snippets
      editorconfig.editorconfig
      esbenp.prettier-vscode
      fcrespo82.markdown-table-formatter
      gruntfuggly.todo-tree
      james-yu.latex-workshop
      jebbs.plantuml
      jock.svg
      mechatroner.rainbow-csv
      mikestead.dotenv
      mitchdenny.ecdc
      mkhl.direnv
      ms-azuretools.vscode-containers
      ms-ceintl.vscode-language-pack-pl
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-python.debugpy
      ms-python.isort
      ms-python.pylint
      ms-python.python
      ms-python.python
      ms-vscode.cmake-tools
      naumovs.color-highlight
      oderwat.indent-rainbow
      pkgs.vscode-extensions.jnoortheen.nix-ide
      pkgs.vscode-extensions.ms-vscode.cpptools
      redhat.vscode-yaml
      savh.json5-kit
      signageos.signageos-vscode-sops
      streetsidesoftware.code-spell-checker
      usernamehw.errorlens
      vscodevim.vim
      waderyan.gitblame
    ];
  };

}
