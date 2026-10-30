# homebrew-tap

Homebrew tap for [LightGenSubz](https://github.com/light-gen-subz/light-gen-subz).

## Install

```bash
brew install --cask light-gen-subz/tap/light-gen-subz
```

## Update

```bash
brew update
brew upgrade --cask light-gen-subz
```

## Uninstall

```bash
brew uninstall --cask light-gen-subz
brew untap light-gen-subz/tap
```

Add `--zap` to `brew uninstall` to also remove the app's settings and caches.

## About unsigned builds

LightGenSubz is not signed or notarized by Apple. If macOS refuses to open it on first launch, remove the quarantine attribute once:

```bash
xattr -dr com.apple.quarantine "/Applications/LightGenSubz.app"
```

## License

MIT — see [LICENSE](LICENSE).
