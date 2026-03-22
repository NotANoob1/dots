{ inputs, pkgs, ... }:

{
  programs.kdeconnect.enable = true;
  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
  ];
}
