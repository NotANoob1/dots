{ inputs, pkgs, ... }:

{
  imports = [
    ./standard.nix
    ./hardware/thinkpad-hardware.nix

    ../users/notanoob.nix
    ../users/notanoob-school.nix
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    git
    xwayland-satellite
    libnotify
    kdePackages.kpeople
  ];

  environment.variables = {
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

}
