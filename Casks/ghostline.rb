cask "ghostline" do
  version "0.1.0"
  sha256 "c1b519be83a7d30f355788d0c5c5d78b205c9db5958d3343fe4b854ab71dec63"

  url "https://github.com/hrithik73/ghostline/releases/download/v#{version}/HTerm.zip"
  name "Ghostline"
  desc "Agent-first terminal built on Ghostty"
  homepage "https://github.com/hrithik73/ghostline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "HTerm.app"

  uninstall quit: "dev.hritik.ghostline"

  caveats <<~EOS
    HTerm is not signed or notarized, so macOS will flag it. Remove the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/HTerm.app
  EOS
end
