{ inputs, pkgs, ... }:

{
  services.kdeconnect.enable = true;
  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
  ];
}
