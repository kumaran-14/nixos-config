{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    # powerline-fonts
    source-code-pro
    roboto-slab
    source-sans-pro
    nerd-fonts.fira-code
    nerd-fonts.hasklug
    nerd-fonts.droid-sans-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.im-writing
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.sauce-code-pro
    nerd-fonts.inconsolata
    nerd-fonts.symbols-only
    sketchybar-app-font
    montserrat
    raleway
    vegur
    noto-fonts
    vista-fonts # needed for msoffice
  ];
  system.defaults = {
    NSGlobalDomain = {
      AppleFontSmoothing = 2;
    };
  };
}
