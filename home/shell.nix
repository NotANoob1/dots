{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /dots/#nixos-btw && notify-send 'rebuild done'";
      frb = "sudo nixos-rebuild switch --no-reexec --flake /dots/#nixos-btw && notify-send 'fast rebuild done'";
      ls = "eza --color=always --icons=always --git-ignore";
      tree = "eza --color=always --icons=always -T --git-ignore";
      lsa = "eza --color=always --icons=always -a";
      treea = "eza --color=always --icons=always -T -a";
      cat = "bat";
    };
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
    presets = [ "catppuccin-powerline" ];
    settings.cmd_duration.show_notifications = false;
  };
}
