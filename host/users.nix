{ pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.notanoob = {
      imports = [
        ../home/default.nix
      ];

      home.username = "notanoob";
      home.homeDirectory = "/home/notanoob";
    };

    users.notanoob-school = {
      imports = [
        ../home/default.nix
      ];

      home.username = "notanoob-school";
      home.homeDirectory = "/home/notanoob-school";
    };

    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };

  users.users.notanoob = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  users.users.notanoob-school = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;
}
