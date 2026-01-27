{primaryUser, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = ["**/.DS_STORE"];
    settings = {
      user.name = "kumaran-14";
      user.email ="32682103+kumaran-14@users.noreply.github.com";
      github = {
        user = primaryUser;
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        pager = "delta";
      };
      delta = {
        "true-color" = "always";
        "syntax-theme" = "DarkNeon";
        "navigate" = "true";
        "line-numbers" = "true";

      };
      diff = {
        "colorMoved" = "default";
      };
    };
  };
}
