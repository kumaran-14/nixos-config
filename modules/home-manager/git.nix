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
	      pager = ''
        delta --dark --highlight-removed --commit-style box --file-style box --theme='Monokai Extended' --plus-color="#0c5246" --plus-emph-color="#033f85" --minus-color="#6e2e13" --minus-emph-color="#870375"
        '';
      };
    };
  };
}
