{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";

    targets.zen-browser.profileNames = [ "default" ];

    targets.starship = {
      colors.enable = false;
      enable = false;
    };

    targets.qt.enable = true;
    targets.gtk.enable = true;
    targets.kde.enable = true;

    icons = {
      enable = true;
      package = pkgs.reversal-icon-theme;
      light = "Reversal";
      dark = "Reversal";
    };

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/bars.jpg";
      hash = "sha256-y3ajJtjTZOcq0LsGhWdybS2mYeDOLw0COEUyqKHFb8g=";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.commit-mono;
        name = "CommitMono Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.cousine;
        name = "Cousine Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.cousine;
        name = "Cousine Nerd Font";
      };
    };

  };

  fonts.fontconfig.enable = true;
}
