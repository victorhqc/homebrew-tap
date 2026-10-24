cask "filbert" do
  version "0.23.0"
  sha256 "212bb97ffb580d137c67c265b5eb5d52eff1d16aabce2300f850257685893747"

  url "https://github.com/victorhqc/filbert/releases/download/v#{version}/Filbert-#{version}-arm64.dmg"
  name "Filbert"
  desc "Menu bar usage tracker for AI coding providers"
  homepage "https://victorhqc.github.io/filbert/"

  livecheck do
    url "https://victorhqc.github.io/filbert/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Filbert.app"

  # The Claude Code helper in ~/.claude stays: settings.json wraps the user's
  # statusline around it, and only Filbert's own uninstall restores that file.
  zap trash: [
    "~/.cache/filbert",
    "~/Library/Caches/com.victorhqc.filbert",
    "~/Library/HTTPStorages/com.victorhqc.filbert",
    "~/Library/Logs/Filbert",
    "~/Library/Preferences/com.victorhqc.filbert.plist",
  ]
end
