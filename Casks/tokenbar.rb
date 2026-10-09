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

  depends_on macos: ">= :ventura"

  app "Tokenbar.app"

  # The app is ad-hoc signed (no Developer ID), so clear quarantine instead of making users click "Open Anyway".
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tokenbar.app"]
  end

  uninstall quit: "com.hritik.tokenbar"

  zap trash: "~/Library/Preferences/com.hritik.tokenbar.plist"
end
