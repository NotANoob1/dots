{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak

    ./shell/shell.nix

    ./de/stylix.nix
    ./de/niri.nix

    ./browsers/zen.nix
    ./browsers/helium.nix
  ];

  home.stateVersion = "25.11";

  xdg.enable = true;

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    tree
    ripgrep
    nemo
    wlsunset
    nerd-fonts.cousine
    nerd-fonts.commit-mono
    eza
    zip
    unzip
    fd
    jq
    bat
    tmux
    fastfetch
    lazygit
    gh
    qimgv
    cliphist
  ];

  programs.alacritty.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "image/png" = [ "qimgv.desktop" ];
      "image/jpeg" = [ "qimgv.desktop" ];
    };
  };

  programs.obsidian = {
    enable = true;
    package = pkgs.obsidian;
  };
}
