{ inputs, pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./zen.nix
    ./stylix.nix
    ./nvim.nix
    ./shell.nix
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.stateVersion = "25.11";

  xdg.enable = true;

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    inputs.helium.defaultPackage.x86_64-linux
    tree
    ripgrep
    nemo
    wlsunset
    nerd-fonts.cousine
    nerd-fonts.commit-mono
    eza
    zip
    unzip
    yazi
    fd
    jq
    bat
    tmux
    fastfetch
    lazygit
    gh
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "notanoob";
        email = "cooperye09@gmail.com";
      };
      safe.directory = [
        "/dots"
      ];
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /dots/#nixos-btw";
    };
  };

  programs.alacritty.enable = true;
}
