{ inputs, pkgs, ... }:

{
  home-manager.users.notanoob-school = {
    imports = [
      ../home/standard.nix
      ../home/browsers/default/helium.nix
    ];

    home.username = "notanoob-school";
    home.homeDirectory = "/home/notanoob-school";
  };

  users.users.notanoob-school = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
