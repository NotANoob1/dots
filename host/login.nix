{... }:

{
  programs.regreet.enable = true;

  services.greetd.enable = true;

  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
  };
}
