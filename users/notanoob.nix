{ inputs, pkgs, ... }:

{
  home-manager.users.notanoob = {
    imports = [
      ../home/standard.nix
      ../home/browsers/default/zen.nix
      ../home/notanoob/default.nix
    ];

    home.username = "notanoob";
    home.homeDirectory = "/home/notanoob";
  };

  users.users.notanoob = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
