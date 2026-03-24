{ inputs, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri-git.packages.x86_64-linux.default;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}
