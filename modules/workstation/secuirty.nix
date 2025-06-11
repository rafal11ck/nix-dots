{
  security = {
    pam.services.swaylock.fprintAuth = true;
    polkit = {
      enable = true;
    };
  };
}
