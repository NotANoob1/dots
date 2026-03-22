{ pkgs, ... }:

{
  security.rtkit.enable = true;

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

  services = {    
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    pulseaudio = {
      package = pkgs.pulseaudioFull;
    };

    upower.enable = true;
    tuned.enable = true;
    gnome.evolution-data-server.enable = true;
    systembus-notify.enable = true;
    flatpak.enable = true;
  };
}
