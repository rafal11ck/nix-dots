{
  pkgs,
  inputs,
  ...
}:

let
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
    profiles.default.extensions = with vs-extensions.vscode-marketplace; [
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
      ms-kubernetes-tools.vscode-kubernetes-tools
      mechatroner.rainbow-csv
      naumovs.color-highlight
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
      streetsidesoftware.code-spell-checker
      ms-ceintl.vscode-language-pack-pl
      editorconfig.editorconfig
      csstools.postcss
      mikestead.dotenv
      christian-kohler.path-intellisense
      savh.json5-kit
      ms-python.python
      oderwat.indent-rainbow
      ms-azuretools.vscode-containers
    ];
  };

}
