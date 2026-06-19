{
  programs.firefox = {

    enable = true;
    # Stay on legacy path: Mozilla still hardcodes ~/.mozilla/native-messaging-hosts/
    # and Thunderbird has no XDG support, so ~/.mozilla/ exists either way.
    configPath = ".mozilla/firefox";
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/17

      "EnableTrackingProtection" = {
        "Value" = true;
      };

      "PasswordManagerEnabled" = {
        Value = false;
      };

      "Preferences" = {

        # preview
        "browser.tabs.hoverPreview.enabled" = {
          Value = true;
        };

        #
        "browser.quitShortcut.disabled" = {
          Value = true;
        };

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

        # Do not nag
        browser.translations.automaticallyPopup = {
          Value = false;
        };

        "media.ffmpeg.vaapi.enabled" = {
          Value = true;
        };

        "browser.download.useDownloadDir" = {
          Value = true;
        };
      };
    };

  };
}
