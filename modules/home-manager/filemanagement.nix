{pkgs, ...}: {
    home.packages = with pkgs; [
      dust
      file
      fzy
      curl
      duf # df alternative showing free disk space
      fswatch
      tree
      rsync

      # compression
      atool
      unzip
      gzip
      xz
      zip
    ];
    programs = {
      eza.enable = true;
      fd.enable = true;
      ripgrep.enable = true;
      bat = {
        enable = true;
        config = {
            italic-text = "always";
            pager = "less -F -g -i -M -R -S -w -z-4";
            # TODO: pager = "page -WO -q 90000";
            theme = "OneHalfDark";
            # style = "plain"; # no line numbers; git status; etc... more like cat with colors
            map-syntax = [
                "*.conf:INI"
                ".h:C++"
                ".zshenv:Bourne Again Shell (bash)"
                ".zprofile:Bourne Again Shell (bash)"
                ".zshrc:Bourne Again Shell (bash)"
                ".zpreztorc:Bourne Again Shell (bash)"
                ".zshenv:Bourne Again Shell (bash)"
                ".zlogin:Bourne Again Shell (bash)"
                ".zlogout:Bourne Again Shell (bash)"
                ];
        };
        extraPackages = with pkgs.bat-extras; [batman batgrep];
      };
      delta.enable = true;
      fzf = {
        enable = true;
        enableZshIntegration = false;
        tmux.enableShellIntegration = false;
        defaultCommand = "\fd --type f --follow --hidden --exclude .git --color=always";
        fileWidgetCommand = "\fd --exclude .git --type f"; # for when ctrl-t is pressed
        changeDirWidgetCommand = "\fd --type d --hidden --follow --max-depth 3 --exclude .git";
        # TODO: not working see fzf colors seoul night and use env variable to control this instead
        colors = {
          fg = "242";
          bg ="233";
          hl="65";
          "fg+" ="15";
          "bg+" ="234";
          "hl+" ="108";
          info="108";
          prompt="109";
          spinner="108";
          pointer="168";
          marker= "168";
        };
      };
    };
}
