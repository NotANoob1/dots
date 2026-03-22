{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ./host/login.nix
    ./host/services.nix
    ./host/users.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago"; 

  environment.systemPackages = with pkgs; [
    git
    xwayland-satellite
    libnotify
  ];

  environment.variables = {
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
  
  security.sudo.configFile = ''
    user_name ALL=(ALL) NOPASSWD:/usr/bin/env nvim
  '';
}
