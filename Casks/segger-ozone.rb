cask "segger-ozone" do
  version "3.28b"
  sha256 "407a1b29fb6e9dc10c351afb6902b25c4ef4ac5f1d9ca2ffab3b1fed8cb1b3c5"

  url "https://www.segger.com/downloads/jlink/Ozone_MacOSX_V#{version.no_dots}_x86_64.pkg"
  name "Ozone"
  desc "J-Link Debugger and Performance Analyzer"
  homepage "https://www.segger.com/products/development-tools/ozone-j-link-debugger"

  livecheck do
    url "https://www.segger.com/downloads/jlink/ReleaseNotes_Ozone.html"
    regex(/<h2>Version\s*(\d+(?:\.\d+)*[a-z]?)/i)
  end

  pkg "Ozone_MacOSX_V#{version.no_dots}_x86_64.pkg"

  uninstall quit:    "com.yourcompany.Ozone",
            pkgutil: "com.segger.pkg.Ozone"

  zap trash: [
    "~/Library/Application Support/SEGGER",
    '~/Library/Application Support/SEGGER\\RTTViewer.ini',
    "~/Library/Saved Application State/com.segger.JFlashLite.*savedState",
    "~/Library/Saved Application State/com.segger.JLinkGDBServer.*savedState",
    "~/Library/Saved Application State/com.segger.JLinkLicenseManager.*savedState",
    "~/Library/Saved Application State/com.segger.JLinkRegistration.*savedState",
    "~/Library/Saved Application State/com.segger.JLinkRemoteServer.*savedState",
    "~/Library/Saved Application State/com.yourcompany.Ozone.savedState",
  ]
end
