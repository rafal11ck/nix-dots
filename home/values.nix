{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options.values = {
    dotfilesPath = mkOption {
      description = "Path to dotfiles directory from home directory of configuration";
      type = types.path;
      default = ../dotfiles;
    };
  };
}
