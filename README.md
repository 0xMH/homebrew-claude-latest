# homebrew-claude-latest

Always up-to-date Homebrew tap for Claude Code.

The official `homebrew-cask` formula lags behind new releases by a few hours (sometimes longer). This tap resolves the latest version directly from Anthropic's CDN at install/upgrade time, so `brew upgrade` always picks up new versions immediately.

## Install

If you have claude-code from the official tap, uninstall it first:

```bash
brew uninstall --cask claude-code
```

Then install from this tap:

```bash
brew tap 0xMH/claude-latest
brew install 0xMH/claude-latest/claude-code
```

## Upgrade

```bash
brew upgrade --greedy-latest
```

`--greedy-latest` is required to upgrade the cask now that its version is set `version :latest`.

That's it. No scripts, no manual version bumping. The cask resolves the latest version dynamically.

## How it works

The cask runs an inline `curl` during evaluation to fetch the latest version string from Anthropic's GCS bucket, then uses that as the download URL. It also fetches `manifest.json` for the resolved version to verify the binary's SHA-256 checksum. Brew compares the resolved version against what's installed and upgrades when needed.

## Uninstall

```bash
brew uninstall --cask claude-code
brew untap 0xMH/claude-latest
```
