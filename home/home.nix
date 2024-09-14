{
  config,
  pkgs,
  lib,
  ...
}:
let

  # Function taking module list where it puts config
  configImport =
    dirs:
    builtins.listToAttrs (
      map (dir: {
        name = dir;
        value = {
          source = ../dotfiles/${dir}/.config/${dir};
          recursive = true;
        };
      }) dirs
    );
in
{
  imports = [
    # ./hello.nix
    ./home-cli.nix
    ./home-gui.nix
  ];
}
