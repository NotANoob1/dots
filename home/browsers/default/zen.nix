{ inputs, lib, ... }:

{
  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.x86_64-linux.beta;
        in
        zen-browser.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map
          (mime: {
            name = mime;
            value = lib.mkDefault value;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "x-scheme-handler/https"
            "application/xhtml+xml"
            "application/json"
            "text/plain"
            "text/html"
          ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };

}
