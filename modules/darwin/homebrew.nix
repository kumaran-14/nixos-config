{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    global.brewfile = true;

    taps = [
      "kamillobinski/thock"
      #for tmux-fingers
      "morantron/tmux-fingers"
      "FelixKratz/formulae"
    ];

    # homebrew is best for GUI apps
    brews = [
      #      "ripgrep"
      "tmux"
      # mac apple store
      "mas"
      # tmux fingers and its dependencies so that nix does not throw error
      "tmux-fingers"
      "bdw-gc"
      "libyaml"
      "pcre2"
      "forgit"

    ];
    # nixpkgs is best for CLI tools
    casks = [
      "alfred"
      "maccy"
      "claude"
      # "thock"
      "alacritty"
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
    masApps = {

      # below apps are manually installed

      # "1Blocker" = 1365531024; 
      # "Bitwarden" = 1352778147  ;
      # "Todoist: To-Do List & Calendar" =  585829637  ;
      # "Tabs Saver for Safari" =  1440006;
      # "Save to Raindrop.io" =  1549370672 ;
      # "Vimari" = 1480933944  ;
      # Thor; For switching between apps. TODO: Export shortcuts and keep track of it somewhere here.

    };
  };
}
