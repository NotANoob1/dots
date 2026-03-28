{ inputs, pkgs, ... }:

{
  services.kdeconnect.enable = false;
  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
  ];
}
