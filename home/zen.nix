{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles.default = rec {
      search = {
        force = true;
        default = "google";
      };

      settings = {
        "zen.urlbar.replace-newtab" = false;
        "zen.welcome-screen.seen" = true;
        "zen.view.use-singe-toolbar" = false;
        "zen.view.compact.enabled-at-startup" = true;
        "sidebar.visibility" = "hide-sidebar";
      };

      extensions.packages = with inputs.firefox-addons.packages.x86_64-linux; [
        darkreader
        ublock-origin
      ];
    };

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };

  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.x86_64-linux.default;
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
