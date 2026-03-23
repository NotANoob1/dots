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

}
