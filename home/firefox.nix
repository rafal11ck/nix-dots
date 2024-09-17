{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.firefox = {

    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/17
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "force_installed";
              default_area = "navbar";
            };
          };
        in
        listToAttrs [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "floccus" "floccus@handmadeideas.org")
          (extension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
          (extension "darkreader" "jid1-KKzOGWgsW3Ao4Q@jetpack")
          (extension "i-dont-care-about-cookies" "jid1-KKzOGWgsW3Ao4Q@jetpack")
          (extension "polish-spellchecker-dictionary" "pl@dictionaries.addons.mozilla.org")
        ];
      # To add additional extensions:
      # If you have it installed:
      # 1. go to about:support, go to Add-ons section grab extension id from table.
      # 2. get short ID legacy way.
      #
      # Legacy way:
      # find it on addons.mozilla.org, find
      # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID

      "EnableTrackingProtection" = {
        "Value" = true;
      };

      "Preferences" = {
        # Disable ads in new tab
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = {
          "Value" = false;
          "Status" = "default";
        };
        "browser.newtabpage.activity-stream.showSponsored" = {
          "Value" = false;
          "Status" = "default";
        };

        # Override default pins in new tab.
        "browser.newtabpage.activity-stream.default.sites" = {
          "Value" = "";
        };

        # Disable first run nagging.
        "browser.aboutwelcome.enabled" = {
          Value = false;
        };

        # Screw home calling
        "browser.newtabpage.activity-stream.discoverystream.endpoints" = {
          Value = "";
        };

      };
    };

  };
}
