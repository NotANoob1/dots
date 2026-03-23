{ inputs, lib, ... }:

{
  home.packages = [ inputs.helium.defaultPackage.x86_64-linux ];
}
