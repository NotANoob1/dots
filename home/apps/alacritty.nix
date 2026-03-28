{
  pkgs,
  lib,
  inputs,
  ...
}:

let
  alacritty = pkgs.alacritty.override {
    withGraphics = true;
  };
in
{
  programs.alacritty = {
    enable = true;
    package = alacritty;
  };
}
