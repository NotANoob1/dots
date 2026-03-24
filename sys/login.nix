{ pkgs, ... }:

let
  noctalia-sddm = pkgs.stdenv.mkDerivation rec {
    pname = "noctalia-sddm";
    version = "1.0.0";
    dontBuild = true;
    src = pkgs.fetchFromGitHub {
      owner = "mahaveergurjar";
      repo = "sddm";
      rev = "noctalia";
      sha256 = "sha256-q/aw4PLSHhS2jKjRl8F1JIBZn1aBV/QBEDgZ+2Oyo2A=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/noctalia-sddm
    '';
  };
in
{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
  };

  environment.systemPackages = [
    pkgs.qt6.qt5compat
    noctalia-sddm
    pkgs.libsForQt5.breeze-icons
    pkgs.kdePackages.breeze-gtk
    pkgs.adwaita-icon-theme
  ];

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "noctalia-sddm";
      extraPackages = [
        pkgs.qt6.qt5compat
        noctalia-sddm
        pkgs.libsForQt5.breeze-icons
        pkgs.kdePackages.breeze-gtk
        pkgs.adwaita-icon-theme
      ];
    };
  };
}
