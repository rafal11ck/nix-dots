{
  environment = {
    variables = {
      PATH = "$HOME/.config/scripts/path:$PATH";
      VISUAL = "code";
      GIT_EDITOR = "nvim";
      EDITOR = "nvim";
    };
    extraInit = [
      "source ~/.profile"
    ];
  };
}
