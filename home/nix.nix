{
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
  };
}
