cask "termik" do
  version "0.1.1"
  sha256 "485b94485c31e6b592fd01f84d4575315a070301b0264769094585fdf5cb5e5d"

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
