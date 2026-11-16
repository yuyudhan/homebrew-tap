# Homebrew formula for nomouse, rendered by scripts/release/homebrew.sh for every release,
# attached to it as nomouse.rb and published to yuyudhan/homebrew-tap as Formula/nomouse.rb by
# scripts/release/publish-homebrew.sh: brew install yuyudhan/tap/nomouse
class Nomouse < Formula
  desc "Keyboard-driven clicking via the accessibility tree"
  homepage "https://github.com/yuyudhan/nomouse"
  # The version comes from the release URLs (brew audit --strict flags a redundant `version`).
  license any_of: ["MIT", "Apache-2.0"]

  # Homebrew allows url and sha256 only per architecture; both get the universal binary.
  on_macos do
    on_arm do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.21/nomouse-universal-apple-darwin.tar.gz"
      sha256 "2eb7a89992b2203ed72a40b35fadbafea63ed6e9bbb203f6adf023aec2583ac4"
    end
    on_intel do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.21/nomouse-universal-apple-darwin.tar.gz"
      sha256 "2eb7a89992b2203ed72a40b35fadbafea63ed6e9bbb203f6adf023aec2583ac4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.21/nomouse-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "029377d2e069fdaa3aa00f0b7aefee0e226b1a001441288f1e68da556b9a1e53"
    end
    on_arm do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.21/nomouse-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8882c93aaf889e4e315db719c850f7e69063b6ab2120c188329332bc270b9469"
    end
  end

  def install
    bin.install "nomouse"
  end

  def caveats
    <<~EOS
      On macOS grant Accessibility and Input Monitoring to your terminal (or to nomouse) in
      System Settings > Privacy & Security, then run: nomouse doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nomouse --version")
  end
end
