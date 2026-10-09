cask "tokenbar" do
  version "1.5"
  sha256 "31c76fcb1cb3286d9b2148fd52de40d0a76bf119e47436dd4b3886112a143222"

  url "https://github.com/hrithik73/tokenbar/releases/download/v#{version}/Tokenbar.dmg"
  name "Tokenbar"
  desc "Menu bar usage limits for Claude Code, Codex and Cursor"
  homepage "https://github.com/hrithik73/tokenbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tokenbar.app"

  uninstall quit: "com.hritik.tokenbar"

  zap trash: "~/Library/Preferences/com.hritik.tokenbar.plist"

  caveats <<~EOS
    Tokenbar is not notarized (no Apple Developer ID). On first launch, open
    System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
