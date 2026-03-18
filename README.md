# homebrew-claude-latest

Always up-to-date Homebrew tap for Claude Code and Claude Desktop.

The official `homebrew-cask` formulas lag behind new releases by a few hours (sometimes longer). This tap resolves the latest version directly from Anthropic's CDN at install/upgrade time, so `brew upgrade` always picks up new versions immediately.

## Install

Add the tap:

```bash
brew tap 0xMH/claude-latest
```

### Claude Code (CLI)

If you have claude-code from the official tap, uninstall it first:

```bash
brew uninstall --cask claude-code
```

Then install:

```bash
brew install 0xMH/claude-latest/claude-code
```

### Claude Desktop (app)

If you have claude from the official tap, uninstall it first:

```bash
brew uninstall --cask claude
```

Then install:

```bash
brew install 0xMH/claude-latest/claude
```

## Upgrade

```bash
brew upgrade
```

That's it. No scripts, no manual version bumping. Both casks resolve the latest version dynamically.

## How it works

**Claude Code** — The cask runs an inline `curl` during evaluation to fetch the latest version string from Anthropic's GCS bucket, then uses that as the download URL.

**Claude Desktop** — The cask fetches `RELEASES.json` from Anthropic's download CDN (the same manifest the app's built-in auto-updater uses), parses the latest release URL, and downloads directly. Brew compares the resolved version against what's installed and upgrades when needed.

## Uninstall

```bash
brew uninstall --cask claude-code
brew uninstall --cask claude
brew untap 0xMH/claude-latest
```
