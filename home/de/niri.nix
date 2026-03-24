{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.niri.homeModules.niri
  ];

  programs.noctalia-shell.enable = true;

  programs.noctalia-shell.settings = {
    wallpaper.overviewEnabled = true;
    location = {
      name = "Plano";
      useFahrenheit = true;
      use12hourFormat = true;
    };
  };

  programs.niri.settings = {
    binds = with config.lib.niri.actions; {

      "Mod+Space".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      "Mod+S".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "controlCenter"
        "toggle"
      ];
      "Mod+Comma".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "settings"
        "toggle"
      ];
      "Mod+Period".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "calendar"
        "toggle"
      ];

      "Mod+Left".action = focus-column-left;
      "Mod+Down".action = focus-window-down;
      "Mod+Up".action = focus-window-up;
      "Mod+Right".action = focus-column-right;

      "Mod+Shift+Left".action = move-column-left;
      "Mod+Shift+Down".action = move-window-down;
      "Mod+Shift+Up".action = move-window-up;
      "Mod+Shift+Right".action = move-column-right;
      "Mod+Alt+Left".action = focus-workspace-down;
      "Mod+Alt+Right".action = focus-workspace-up;

      "Mod+Home".action = focus-column-first;
      "Mod+End".action = focus-column-last;
      "Mod+Shift+Home".action = move-column-to-first;
      "Mod+Shift+End".action = move-column-to-last;

      "Mod+Page_Down".action = focus-workspace-down;
      "Mod+Page_Up".action = focus-workspace-up;
      "Mod+Shift+2".action = move-column-to-workspace-down;
      "Mod+Shift+1".action = move-column-to-workspace-up;

      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;

      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+O".action = toggle-overview;

      "Mod+T".action.spawn = [ "alacritty" ];
      "Mod+B".action.spawn = [
        "xdg-open"
        "https://"
      ];
      "Mod+D".action = close-window;
    };

    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];

    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }
    ];

    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-overview"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
