{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../sys/login.nix
    ../sys/services.nix
    ../sys/niri.nix
  ];

  networking = {
    hostName = "nixos-btw";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;
  programs.git = {
    enable = true;
    config.user = {
      name = "notanoob";
      email = "cooperye09@gmail.com";
    };
  };

  system.stateVersion = "25.11";
}
