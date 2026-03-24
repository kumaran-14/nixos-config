{ pkgs, ... }:
let
  # Custom Ant wrapper that ignores environment variables and points directly to the JARs
  customAnt = pkgs.writeShellScriptBin "ant" ''
    export JAVA_HOME=${pkgs.jdk25.home}
    export ANT_HOME=${pkgs.ant}/share/ant

    exec ${pkgs.jdk25}/bin/java \
      -classpath "${pkgs.ant}/share/ant/lib/ant-launcher.jar" \
      -Dant.home="${pkgs.ant}/share/ant" \
      org.apache.tools.ant.launch.Launcher "$@"
  '';
in
{
  programs.java = {
    enable = true;
    # 'jdk' usually points to the latest LTS (Java 25 in 2026)
    package = pkgs.jdk25;
  };

  home.packages = with pkgs; [
    maven
    gradle
    jdt-language-server
    customAnt
    # Optional: If you want a GUI IDE
    # jetbrains.idea-ultimate
  ];
}
