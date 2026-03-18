cask "claude" do
  releases_json = JSON.parse(`curl -sf https://downloads.claude.ai/releases/darwin/universal/RELEASES.json`.strip)
  current_release = releases_json["currentRelease"]
  matching_release = releases_json["releases"].find { |release| release["version"] == current_release }
  latest = (matching_release || releases_json["releases"].last)["updateTo"]
  resolved_url = latest["url"]

  version :latest
  sha256 :no_check

  url resolved_url,
      verified: "downloads.claude.ai/releases/darwin/universal/"
  name "Claude"
  desc "Anthropic's official Claude AI desktop app"
  homepage "https://claude.com/download"

  livecheck do
    url "https://downloads.claude.ai/releases/darwin/universal/RELEASES.json"
    regex(/"currentRelease"\s*:\s*"(\d+(?:\.\d+)+)"/i)
  end

  depends_on macos: ">= :monterey"

  app "Claude.app"

  zap trash: [
        "~/Library/Application Support/Claude",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.anthropic.claudefordesktop.sfl*",
        "~/Library/Caches/com.anthropic.claudefordesktop",
        "~/Library/Caches/com.anthropic.claudefordesktop.ShipIt",
        "~/Library/HTTPStorages/com.anthropic.claudefordesktop",
        "~/Library/Logs/Claude",
        "~/Library/Preferences/com.anthropic.claudefordesktop.plist",
        "~/Library/Saved Application State/com.anthropic.claudefordesktop.savedState",
      ]
end
