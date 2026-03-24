{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    ./keyboard.nix
    ./fonts.nix
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix = {
    settings = {
      max-jobs = 8;
      cores = 0; # use them all

      # Necessary for using flakes on this system.
      experimental-features = "nix-command flakes";
      # The default at 10 is rarely enough.
      log-lines = 25;

      # Increase download buffers for faster connections
      download-buffer-size = 1073741824; # 1 GiB
      nar-buffer-size = 134217728; # 128 MiB
    };
  };

  nixpkgs.config.allowUnfree = true;
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # homebrew installation manager
  nix-homebrew = {
    user = primaryUser;
    enable = true;
  };

  # home-manager config
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
    users.${primaryUser} = {
      imports = [
        ../home-manager
      ];
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
    };
    backupFileExtension = "nix-backup";
    overwriteBackup = true;
  };

  # macos specific settings
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}"; # Ensure this path is correct for your system
    shell = pkgs.zsh;
    # You might also want to set other user options here
  };
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    systemPackages = [
      pkgs.coreutils
      pkgs.git
      pkgs.clang-tools
      pkgs.llvm
      pkgs.uv
    ];
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
    variables = {
      HOMEBREW_NO_XCODE = "1";
      HOMEBREW_NO_INSTALL_CLT = "1";
    };
  };
}
