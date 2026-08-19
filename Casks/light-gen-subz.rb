cask "light-gen-subz" do
  version "1.0.0"
  sha256 "610a713ab7bc3861d3c7483e86fb612a01218daaf5c347ae8328234b11e48c33"

  url "https://github.com/light-gen-subz/light-gen-subz/releases/download/v#{version}/light-gen-subz_aarch64.app.tar.gz"
  name "LightGenSubz"
  desc "Generate SRT subtitles from video or audio, fully offline"
  homepage "https://light-gen-subz.github.io/light-gen-subz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships Tauri's updater and replaces itself in place.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur
  depends_on formula: "ffmpeg"

  app "light-gen-subz.app"

  zap trash: [
    "~/Library/Application Support/com.sikander.light-gen-subz",
    "~/Library/Caches/com.sikander.light-gen-subz",
    "~/Library/Preferences/com.sikander.light-gen-subz.plist",
    "~/Library/Saved Application State/com.sikander.light-gen-subz.savedState",
    "~/Library/WebKit/com.sikander.light-gen-subz",
  ]

  caveats <<~EOS
    LightGenSubz is not signed or notarized by Apple. On first launch macOS may
    refuse to open it. Remove the quarantine attribute once:

      xattr -dr com.apple.quarantine "/Applications/light-gen-subz.app"
  EOS
end
