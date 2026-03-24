{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.nixfmt
  ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "full";
      window.dynamic_title = true;
      #background_opacity = 0.9;
      window.opacity = 1.0;
      scrolling.history = 3000;
      # scrolling.smooth = true;
      font.normal.family = "MesloLGS Nerd Font Mono";
      font.normal.style = "Regular";
      font.bold.style = "Bold";
      font.italic.style = "Italic";
      font.bold_italic.style = "Bold Italic";
      font.size = if pkgs.stdenvNoCC.isDarwin then 16 else 9;
      terminal.shell.program = "${pkgs.zsh}/bin/zsh";
      general.live_config_reload = true;
      cursor.vi_mode_style = "Underline";
      colors.draw_bold_text_with_bright_colors = true;
      selection.save_to_clipboard = true;
      keyboard.bindings = [
        {
          key = "Escape";
          mods = "Control";
          mode = "~Search";
          action = "ToggleViMode";
        }
        # cmd-{ and cmd-} and cmd-] and cmd-[ will switch tmux windows
        # {
        #   key = "LBracket";
        #   mods = "Command";
        #   # \x02 is ctrl-b so sequence below is ctrl-b, h
        #   chars = "\\x02h";
        # }
        # {
        #   key = "RBracket";
        #   mods = "Command";
        #   chars = "\\x02l";
        # }
      ];
    };
  };
}
