cask "tokenbar" do
  version "1.4"
  sha256 "5b9490ffb8e38058f10951b55001f21b29a1b2886f1228c06809442b1c8772ce"

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
