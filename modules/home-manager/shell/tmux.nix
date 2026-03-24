

{
  pkgs,
  lib,
  ...
}: {
    ######################### This approach did not work, so moving to method 2
    # home.file.".terminfo/74/tmux-256color".source =
    #   ../../../dotfiles/terminfo/74/tmux-256color;
    # programs.tmux = {
    #   enable = false;
    #   keyMode = "vi";
    #   mouse = true;
    #   newSession = true;
    #   shell = "${pkgs.zsh}/bin/zsh";
    #   historyLimit = 50000;
    #   escapeTime = 0;
    #   #sensibleOnTop = true;
    #   disableConfirmationPrompt = true;
    #   plugins = with pkgs; [
    #     # tmuxPlugins.sensible
    #     # tmuxPlugins.open
    #     {
    #       plugin = tmuxPlugins.sidebar;
    #       extraConfig = ''
    #         set -g @sidebar-tree 'e'
    #         set -g @sidebar-tree-command 'tree -C'
    #       '';
    #     }
    #     {
    #       plugin = tmuxPlugins.catppuccin;
    #       extraConfig = '' 
    #         set -g @catppuccin_flavour 'frappe'
    #         set -g @catppuccin_window_tabs_enabled on
    #         set -g @catppuccin_date_time "%H:%M"
    #       '';
    #     }
    #     {
    #       plugin = tmuxPlugins.fingers;
    #       extraConfig = ''
    #         # Enter Fingers mode by pressing <prefix> + 'j' . NOTE: pressing '?' will show help, which shows many useful tips
    #         # Tip: All commands can be configured easily. Very powerful if taken advantage of. 
    #         set -g @fingers-key 'j' 
    #         # set -g @fingers-hint-style 'fg=magenta,bold,bright,underscore'
    #         # set -g @fingers-highlight-style 'fg=blue,bold,bright,underscore,italics'
    #       '';
    #     }
    #   ];
    #   extraConfig = builtins.readFile ../../../dotfiles/tmux.conf;
    #};



      # Method 2:
      # tmux is installed via homebrew using nix
      # tpm is installed manually as part of the tmux.conf last step and activated
      # first time running tmux, you probably have to run prefix + I to install plugins
      home.file.".config/tmux/tmux.conf" = {
        source = ../../../dotfiles/tmux.conf;
      };
}
