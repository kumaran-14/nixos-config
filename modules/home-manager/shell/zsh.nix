{
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    autocd = true;
    # history = {
    #   expireDuplicatesFirst = true;
    #   ignoreSpace = true;
    #   save = 10000; # save 10,000 lines of history
    # };

    # things to add to .zshenv
    envExtra = ''
      # don't use global env as it will slow us down
      skip_global_compinit=1
      # disable the reading of /etc/zshrc, which has redundant things and crap I don't want
      # like brew shellenv which takes forever, plus redundant compinit calls
      export NOSYSZSHRC="1"
      export LANGUAGE="en_US.UTF-8"
      export LC_ALL="en_US.UTF-8"
    '';
    completionInit = ''
      # only update compinit once each day
      # better solution would be to pre-build zcompdump with compinit call then link it in
      # and never recalculate
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C

      # disable sort when completing `git checkout`
      zstyle ':completion:*:git-checkout:*' sort false
      # set descriptions format to enable group support
      zstyle ':completion:*:descriptions' format '[%d]'
      # set list-colors to enable filename colorizing
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    '';
    initContent = lib.mkBefore ''
      set -o vi
      bindkey -v

      # Reduce delay when hitting escape/sequence
      export KEYTIMEOUT=10

      # You might not like what I'm doing here, but '/' works like ctrl-r
      # and matches as you type. I've added pattern matches here though.

      #bindkey -M vicmd '/' history-incremental-pattern-search-backward # default is vi-history-search-backward
      #bindkey -M vicmd '?' vi-history-search-backward # default is vi-history-search-forward

      # Map 'kj' to escape to Normal Mode
      bindkey -M viins 'kj' vi-cmd-mode


      # Make 'H' go to the beginning of the line in Normal Mode
      bindkey -M vicmd 'H' vi-beginning-of-line

      # Make 'L' go to the end of the line in Normal Mode
      bindkey -M vicmd 'L' vi-end-of-line


      # pressing v opens command in full vim editor
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd 'v' edit-command-line

      # for "cd ..../dir"
      rationalise-dot() {
        if [[ $LBUFFER = *.. ]]; then
          LBUFFER+=/..
        else
          LBUFFER+=.
        fi
      }

      zle -N rationalise-dot
      bindkey . rationalise-dot


      #### Change cursor depending on mode
      # following are needed with starship to get the cursors right
      # below versions are non-blinking; use 1,3,5 for blinking versions
      function _cursor_block() { echo -ne '\e[2 q' }
      function _cursor_bar() { echo -ne '\e[4 q' }
      function _cursor_beam() { echo -ne '\e[6 q' }
      function zle-line-finish {
          _cursor_block
      }
      function zle-keymap-select zle-line-init {
          case $KEYMAP in
              vicmd)      _cursor_block;;
              viins|main) _cursor_beam;;
              *)          _cursor_bar;;
          esac
      }
      rgfz() {
        RG_PREFIX="rg --line-number --no-heading --color=always -i"
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$*'" \
        fzf --ansi \
            --bind "change:reload:$RG_PREFIX {q} || true" \
            --preview 'bat --style=plain --color=always {1} --highlight-line {2}' \
            --delimiter ':' \
            --bind 'enter:execute($EDITOR +{2} {1} > /dev/tty)'
      }
      zle -N zle-line-init
      zle -N zle-line-finish
      zle -N zle-keymap-select
      #I have the following in my .zshrc that I'm sure I copied from somewhere. It allows the use of Ctrl-z to also resume programs runnings in the background instead of manually typing fg.
      # Allow Ctrl-z to toggle between suspend and resume
      function Resume {
          fg
          zle push-input
          BUFFER=""
          zle accept-line
      }
      zle -N Resume
      bindkey "^Z" Resume

    '';

    initExtra = ''
        # Add your forgit sourcing here
        [ -f "/opt/homebrew/share/forgit/forgit.plugin.zsh" ] && source "/opt/homebrew/share/forgit/forgit.plugin.zsh"
    '';

    sessionVariables = { };
    plugins = [
      {
        # better vi mode, see https://github.com/jeffreytse/zsh-vi-mode
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }
    ];

    shellAliases = {
      #### Good "ol Clear Screen command

      c = "clear";
      cls = "clear";

      # this is ls using eza
      ls = "eza --icons --hyperlink --git --classify=always -la";

      #### Cat to Ba;
      cat = "bat";
      man = "batman";

      #### Preview file;
      vv = ''
        fzf --preview-window=wrap --preview "bat --style=plain --theme="OneHalfDark" --color=always {}" --height=75%
      '';

      ### use fzf to open the preview the file and open in vim by pressing enter
      v = ''file_to_edit=$(fzf --preview-window=wrap --preview "bat --style=numbers --theme='OneHalfDark' --color=always {}" --height=75%); [ -n "$file_to_edit" ] && vim "$file_to_edit"'';

      #### Resume wget by defaul;
      wget = "wget -c";

      #### Typo;
      ehco = "echo";
      relaod = "reload";
      pyhton = "python";
      got = "git";
      gut = "git";
      g = "git";
      reload = ".~/.zshrc && echo 'zsh config sourced ~/.zshrc'";

      #### List all files with full pat;
      lff = ''
        fd "$(pwd)" -t f;
      '';
      lfd = ''
        fd "$(pwd)" -t d;
      '';
      gs = "git status";
      gst = "git stash";
      gsta = "git stash apply";

    };
  };
}
