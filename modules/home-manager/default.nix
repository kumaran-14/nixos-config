{
  primaryUser,
  pkgs,
  ...
}: {
  imports = [
    # ./packages.nix
    ./git.nix
    ./vim.nix
    ./gui/dev-gui.nix
    ./filemanagement.nix
    ./shell/devshell.nix
    # ./shell.nix
    # ./mise.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    stateVersion = "25.11";
    sessionVariables = {
      # shared environment variables
      EDITOR = "vim";
    };

    # Let home-manager install and manage itself.
    packages = with pkgs; [];

    # create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";
  };
}
