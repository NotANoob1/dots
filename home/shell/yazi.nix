{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {

    };
    enableZshIntegration = true;
    extraPackages = [
      pkgs.ueberzugpp
    ];
  };

  home.packages = [ pkgs.ueberzugpp ];
}
