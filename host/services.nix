{ pkgs, ... }:

{
  services.upower.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
    };
  };

  services.pulseaudio = {
    package = pkgs.pulseaudioFull;
  };

  services.tuned.enable = true;

  services.gnome.evolution-data-server.enable = true;

  services.systembus-notify.enable = true;
}
