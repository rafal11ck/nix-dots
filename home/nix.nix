{
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than +10 --delete-older-than 90d";
    };
  };
}
