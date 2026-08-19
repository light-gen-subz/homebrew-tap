# LightGenSubz Homebrew Tap

Official Homebrew tap for [**light-gen-subz**](https://light-gen-subz.github.io/light-gen-subz/) — turn any video or audio file into an `.srt` subtitle track, fully offline.

## Install

```bash
brew install --cask light-gen-subz/tap/light-gen-subz
```

Or use the project's one-line installer, which runs the same `brew install` on macOS and installs
the `.deb` / `.AppImage` on Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/light-gen-subz/light-gen-subz/main/install.sh | bash
```

## Upgrade

```bash
brew upgrade --cask light-gen-subz
```

## Uninstall

```bash
brew uninstall --cask light-gen-subz
brew untap light-gen-subz/tap
```

Add `--zap` to also remove settings, caches and application data:

```bash
brew uninstall --zap --cask light-gen-subz
```

## Requirements

- **macOS 11 Big Sur or later**, Apple Silicon only.
- [`ffmpeg`](https://ffmpeg.org) is a **required runtime dependency** and is pulled in
  automatically by the cask.
- The first run downloads a whisper model (~190 MB). Enabling local translation downloads
  an additional NLLB-200 model (~900 MB).

The app is not signed with an Apple Developer certificate. If macOS refuses to open it,
clear the quarantine flag once:

```bash
xattr -dr com.apple.quarantine "/Applications/light-gen-subz.app"
```

## Contents

| Cask | Description |
|------|-------------|
| [`light-gen-subz`](Casks/light-gen-subz.rb) | LightGenSubz desktop app (arm64 DMG) |

## How this tap is updated

Nothing here is edited by hand. Publishing a release in the
[main repository](https://github.com/light-gen-subz/light-gen-subz) triggers its
`update-homebrew-tap` workflow, which recomputes the DMG checksum and bumps `version`
and `sha256` in `Casks/light-gen-subz.rb`.

The cask body itself is the source of truth and lives only here — the workflow rewrites
those two fields and nothing else, so an edit made in this repository is never
overwritten by the next release. Before pushing, the workflow audits and actually
installs the candidate cask on a macOS runner; a cask that fails to install never
reaches this repository.

The workflow needs a `HOMEBREW_TAP_TOKEN` secret on the main repository (a PAT with
`contents: write` here).

## Issues

Report problems on the [main issue tracker](https://github.com/light-gen-subz/light-gen-subz/issues).
