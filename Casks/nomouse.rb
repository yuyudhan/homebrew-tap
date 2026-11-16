# Homebrew cask for nomouse.app, rendered by scripts/release/homebrew.sh for every release that
# has the disk image, attached to it as nomouse-app.rb and published to yuyudhan/homebrew-tap as
# Casks/nomouse.rb by scripts/release/publish-homebrew.sh: brew install --cask
# yuyudhan/tap/nomouse. The formula (Formula/nomouse.rb) stays for the bare command line.
cask "nomouse" do
  version "0.1.21"
  sha256 "27c5e157961996b5bc8b8ee0e4a1f7c71fb435db0c8d8264739a7f07426764dd"

  url "https://github.com/yuyudhan/nomouse/releases/download/v#{version}/nomouse-universal-apple-darwin.dmg"
  name "nomouse"
  desc "Keyboard-driven clicking via the accessibility tree"
  homepage "https://github.com/yuyudhan/nomouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "nomouse.app"

  # This build is ad-hoc signed, not notarized, so Gatekeeper would refuse to open it after a
  # download. Clearing the quarantine flag is the same as approving it once in System Settings.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/nomouse.app"]
  end

  uninstall quit: "com.yuyudhan.nomouse"

  zap trash: "~/.config/nomouse"

  caveats <<~EOS
    Start nomouse.app once: it explains the Accessibility permission, opens
    System Settings > Privacy & Security > Accessibility and starts itself again
    once the switch is on.

    This build is ad-hoc signed, not notarized by Apple; Homebrew cleared the
    download quarantine so it opens. macOS ties the Accessibility grant to the
    signature, so after every upgrade switch nomouse on again in
    System Settings > Privacy & Security > Accessibility.
  EOS
end
