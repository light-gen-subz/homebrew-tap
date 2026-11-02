cask "light-gen-subz" do
  version "1.0.2"
  sha256 "bd78379579b9366205240c8f12b0e759d5b1b408dd1c4793388ca81b71a3addb"

  url "https://github.com/light-gen-subz/light-gen-subz/releases/download/v#{version}/LightGenSubz_aarch64.app.tar.gz"
  name "LightGenSubz"
  desc "Generate SRT subtitles from video or audio, fully offline"
  homepage "https://github.com/light-gen-subz/light-gen-subz"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships Tauri's updater and replaces itself in place.
  auto_updates true
  depends_on arch: :arm64
  depends_on formula: "ffmpeg"
  # The app needs macOS 13.4 or later.
  depends_on macos: :ventura

  app "LightGenSubz.app"

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

      xattr -dr com.apple.quarantine "/Applications/LightGenSubz.app"
  EOS
end
