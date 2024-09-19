{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.values = {

    catppuccinAccent = mkOption {
      description = "Catppuccin accent setting";
      type = types.str;
      default = "Pink";
    };

    #https://nix.catppuccin.com/options/nixos-options.html#catppuccinaccent
    catppuccinFlavor = mkOption {
      description = "Catppuccin Flavor setting";
      type = types.str;
      default = "Mocha";
    };

    mainUser = mkOption {
      description = "The name of the main user";
      type = types.str;
      default = "rafal";
    };
  };

}
