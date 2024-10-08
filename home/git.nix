{
  config,
  ...
}:
let
  values = config.values;
in
{
  programs.git = {
    enable = true;
    userName = "${values.mainUser}";
    userEmail = "you@example.com";

    extraConfig = {
      pull = {
        rebase = false;
      };
    };
  };
}
