{
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      format = pkgs.lib.concatStrings [
        #"$os" # turns out it takes starship 20ms to figure out the OS at every prompt, but we can hard code it at build time
        # alt for linux: "🐧 "
        "$shell"
        "$username"
        "$hostname"
        #"$singularity"
        #"$kubernetes"
        "$directory"
        #"$vcsh"
        "$fossil_branch"
        "$git_branch"
        # "$git_commit"
        # "$git_state"
        # "$git_status"
        # "$git_metrics"
        #"$hg_branch"
        #"$pijul_channel"
        "$sudo"
        #"$jobs"
        "$line_break"
        #"$battery"
        #"$time"
        "$status"
        "$container"
        "$character"
      ];
      right_format = pkgs.lib.concatStrings [
        "$cmd_duration"
        "$shlvl"
        "$docker_context"
        "$package"
        "$c"
        "$cmake"
        #"$daml"
        #"$dart"
        #"$deno"
        #"$dotnet"
        #"$elixir"
        #"$elm"
        #"$erlang"
        #"$fennel"
        "$golang"
        #"$guix_shell"
        #"$haskell"
        #"$haxe"
        #"$helm"
        "$java"
        #"$julia"
        #"$kotlin"
        #"$gradle"
        #"$lua"
        #"$nim"
        "$nodejs"
        #"$ocaml"
        #"$opa"
        #"$perl"
        #"$php"
        #"$pulumi"
        #"$purescript"
        "$python"
        #"$raku"
        #"$rlang"
        #"$red"
        #"$ruby"
        "$rust"
        #"$scala"
        #"$swift"
        #"$terraform"
        #"$vlang"
        #"$vagrant"
        #"$zig"
        "$buf"
        "$nix_shell"
        "$conda"
        "$meson"
        #"$spack"
        "$memory_usage"
        "$aws"
        #"$gcloud"
        #"$openstack"
        #"$azure"
        "$env_var"
        #"$crystal"
        "$custom"
      ];
      character = {
        success_symbol = "[⋙](purple)";
        error_symbol = "[⋙](bold red)";
        vicmd_symbol = "[V](bold green)";
      };
      scan_timeout = 30;
      command_timeout = 200; # default is 500ms, but screw that
      add_newline = true;
      gcloud.disabled = true;
      aws.disabled = false;
      os.disabled = false;
      #os.symbols.Macos = "";
      kubernetes = {
        disabled = true;
        context_aliases = {
          "gke_.*_(?P<var_cluster>[\\w-]+)" = "$var_cluster";
        };
      };
      git_status.style = "blue";
      #git_metrics.disabled = true;
      git_branch.style = "bright-black";
      #git_branch.format = "[  ](bright-black)[$symbol$branch(:$remote_branch)]($style) ";
      time.disabled = true;
      directory = {
      #  format = "[    ](bright-black)[$path]($style)[$read_only]($read_only_style)";
        truncation_length = 4;
        truncation_symbol = "…/";
      #  style = "bold blue"; # cyan
        truncate_to_repo = false;
      };
      package.disabled = true;
      package.format = "version [$version](bold green) ";
      #nix_shell.symbol = " ";
      #rust.symbol = " ";
      #shell = {
        #disabled = false;
        #format = "[$indicator]($style)";
        #style = "bright-black";
        #bash_indicator = " bsh";
        #nu_indicator = " nu";
        #fish_indicator = " ";
        #zsh_indicator = ""; # don't show when in my default shell type
        #unknown_indicator = " ?";
        #powershell_indicator = " _";
      #};
      #cmd_duration = {
        #format = "[$duration]($style)   ";
        #style = "bold yellow";
        #min_time_to_notify = 5000;
      #};
      #jobs = {
        #symbol = "";
        #style = "bold red";
        #number_threshold = 1;
        #format = "[$symbol]($style)";
      #};
    };
  };
}