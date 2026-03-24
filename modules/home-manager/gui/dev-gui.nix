{
  pkgs,
  lib,
  ...
}:
{
  # Taken from zmre's github dev-gui.nix file for vscode
  # VSCode whines like a ... I don't know, but a lot when the config file is read-only
  # I want nix to govern the configs, but to let vscode edit it (ephemerally) if I change
  # the zoom or whatever. This hack just copies the symlink to a normal file
  home.activation.vscodeWritableConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    code_dir="$(echo ~/Library)/Application Support/Code/User"
    settings="$code_dir/settings.json"
    settings_nix="$code_dir/settings.nix.json"
    settings_bak="$settings.bak"

    if [ -f "$settings" ] ; then
      echo "activating $settings"

      $DRY_RUN_CMD mv "$settings" "$settings_nix"
      $DRY_RUN_CMD cp -H "$settings_nix" "$settings"
      $DRY_RUN_CMD chmod u+w "$settings"
      $DRY_RUN_CMD rm -f "$settings_bak"
    fi
  '';

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        codezombiech.gitignore
        mikestead.dotenv
        mskelton.one-dark-theme
        jnoortheen.nix-ide
        vscodevim.vim
        # andenetalexander.vim-cheatsheet # manually install
        esbenp.prettier-vscode
        vspacecode.whichkey # need to configure
        xaver.clang-format
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        formulahendry.code-runner
        ms-vscode-remote.remote-containers
        vscjava.vscode-java-pack
        eamodio.gitlens
        # isntall manually jeff-hykin.better-cpp-syntax
        # install manually danielpinto8zz6.c-cpp-compile-run
      ];
      userSettings = {
        # "gitlens.views.repositories.location"= "scm";
        # "gitlens.views.filehistory.location"= "scm";
        # "gitlens.views.linehistory.location"= "scm";
        # "gitlens.views.compare.location"= "scm";
        # "gitlens.views.search.location"= "scm";
        "files.insertfinalnewline" = true;
        "files.autoSave" = "afterDelay";
        #"window.zoomLevel" = "8";
        "window.customtitlebarvisibility" = "auto";
        # workbench
        "workbench.colorTheme" = "Solarized Light";
        "workbench.icontheme" = "vscode-icons";
        "workbench.panel.defaultlocation" = "right";
        "workbench.colorcustomizations" = {
          "statusbar.background" = "#5f00af";
          "statusbar.nofolderbackground" = "#5f00af";
          "statusbar.debuggingbackground" = "#5f00af";
          "statusbar.foreground" = "#ffffff";
          "statusbar.debuggingforeground" = "#ffffff";
        };
        # editor settings
        "editor.tabSize" = 2;
        "editor.fontLigatures" = true;
        "editor.guides.indentation" = false;
        "editor.insertSpaces" = true;
        #"editor.fontFamily" = "'Hasklug Nerd Font', 'JetBrainsMono Nerd Font', 'FiraCode Nerd Font','SF Mono', Menlo, Monaco, 'Courier New', monospace";
        "editor.fontSize" = 12;
        "editor.formatOnSave" = true;
        "editor.suggestSelection" = "first";
        "editor.scrollBeyondLastLine" = false;
        "editor.cursorBlinking" = "solid";
        "editor.minimap.enabled" = "true";
        "editor.formatOnType" = true;
        "editor.fontfamily" = "go mono, 'droid sans mono', 'monospace', monospace, 'droid sans fallback'";
        "editor.mousewheelzoom" = true;
        "editor.lineNumbers" = "relative";
        "editor.cursorStyle" = "block";
        # vim
        "vim.useSystemClipboard" = true;
        "vim.camelCaseMotion.enable" = true;
        "vim.easymotion" = true;
        "vim.foldfix" = true;
        "vim.highlightedyank.enable" = true;
        "vim.sneak" = true;
        "vim.sneakreplacesf" = true;
        "vim.sneakuseignorecaseandsmartcase" = true;
        # where to put this for nixos?, not working yet
        "vim.vimrc.enable" = true;
        "vim.vimrc.path" = ./vscode-remap.vimrc;
        "vim.statusBarColorControl" = true;
        "vim.cursorStylePerMode.insert" = "line";
        "vim.cursorStylePerMode.normal" = "block";
        "vim.normalModeKeyBindings" = [
          {
            "before" = [ "<C-S-j>" ];
            "commands" = [ "editor.action.moveLinesDownAction" ];
          }
          {
            "before" = [ "<C-S-k>" ];
            "commands" = [ "editor.action.moveLinesUpAction" ];
          }
        ];
        "vim.visualModeKeyBindings" = [
          {
            "before" = [ "<C-S-j>" ];
            "commands" = [ "editor.action.moveLinesDownAction" ];
          }
          {
            "before" = [ "<C-S-k>" ];
            "commands" = [ "editor.action.moveLinesUpAction" ];
          }
        ];
        "[cpp]" = {
          "editor.defaultformatter" = "xaver.clang-format";
        };
        "terminal.explorerkind" = "external";
        "terminal.integrated.cursorblinking" = true;
        "terminal.integrated.cursorstyle" = "line";
        "[typescript]" = {
          "editor.defaultformatter" = "vscode.typescript-language-features";
        };
        "javascript.updateimportsonfilemove.enabled" = "always";
        "bracketpaircolorizer.depreciation-notice" = false;
        "files.associations" = {
          "*.tex" = "latex";
        };
        "latex-workshop.view.pdf.viewer" = "tab";
        "[json]" = {
          "editor.defaultformatter" = "vscode.json-language-features";
          "editor.defaultFormatter" = "vscode.json-language-features";
        };
        "liveserver.settings.donotshowinfomsg" = true;
        "[css]" = {
          "editor.defaultformatter" = "vscode.css-language-features";
        };
        "cmake.pinnedCommands" = [
          "workbench.action.tasks.configureTaskRunner"
          "workbench.action.tasks.runTask"
        ];
        "C_Cpp.default.compilerPath" = "/etc/profiles/per-user/kums/bin/gcc";
        "code-runner.runInTerminal" = "true";
      };
      keybindings = [
        {
          "key" = "alt+k";
          "command" = "-editor.action.accessibilityHelpConfigureKeybindings";
          "when" = "accessibilityHelpIsShown && accessibleViewHasUnassignedKeybindings";
        }
        {
          "key" = "ctrl+shift+j";
          "command" = "editor.action.moveLinesDownAction";
          "when" = "editorTextFocus && !editorReadonly";
        }
        {
          "key" = "alt+down";
          "command" = "-editor.action.moveLinesDownAction";
          "when" = "editorTextFocus && !editorReadonly";
        }
        {
          "key" = "ctrl+shift+k";
          "command" = "editor.action.moveLinesUpAction";
          "when" = "editorTextFocus && !editorReadonly";
        }
        {
          "key" = "alt+up";
          "command" = "-editor.action.moveLinesUpAction";
          "when" = "editorTextFocus && !editorReadonly";
        }
        {
          "key" = "ctrl+cmd+n";
          "command" = "code-runner.run";
        }
        {
          "key" = "ctrl+alt+n";
          "command" = "-code-runner.run";
        }
      ];
    };
  };
  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.idea
  ];
}
