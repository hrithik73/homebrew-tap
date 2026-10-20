cask "termik" do
  version "0.1.0"
  sha256 "edfdafa8c1af3dc4694ea352c98b4ec51f13cccca68b7e886fff57656c715c0d"

  url "https://github.com/hrithik73/termik/releases/download/v#{version}/Termik.zip"
  name "Termik"
  desc "Agent-first terminal built on Ghostty"
  homepage "https://github.com/hrithik73/termik"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Termik.app"

  uninstall quit: "dev.hritik.termik"

  caveats <<~EOS
    Termik is not signed or notarized, so macOS will flag it. Remove the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/Termik.app
  EOS
end
