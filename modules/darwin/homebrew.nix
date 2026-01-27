{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    taps = [
      "kamillobinski/thock"
    ];
    # homebrew is best for GUI apps
    brews = [
      #      "ripgrep"
    ];
    # nixpkgs is best for CLI tools
    casks = [
      # "thock"
      #"alacritty"
      # OS enhancements
      # "aerospace"
      # "cleanshot"
      # "hiddenbar"
      # "raycast"
      # "betterdisplay"
      #
      # # dev
      # "cursor"
      # "ghostty"
      # "visual-studio-code"
      # "zed"
      #
      # # messaging
      # "discord"
      # "slack"
      # "signal"
      #
      # # other
      # "1password"
      # "anki"
      # "brave-browser"
      # "obsidian"
      # "protonvpn"
      # "spotify"
    ];
  };
}
