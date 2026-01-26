{primaryUser, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = ["**/.DS_STORE"];
    settings = {
      user.name = "kumaran-14";
      user.email ="kumarangowrisankar@yahoo.in";
      github = {
        user = primaryUser;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
