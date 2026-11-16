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
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.22/nomouse-universal-apple-darwin.tar.gz"
      sha256 "4f2f8a2b886685251ca22934a8efed371af354d8671f5f091eb3406333cb5484"
    end
    on_intel do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.22/nomouse-universal-apple-darwin.tar.gz"
      sha256 "4f2f8a2b886685251ca22934a8efed371af354d8671f5f091eb3406333cb5484"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.22/nomouse-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7849a96c42afeb9b9801774a1c4de9f2cebf16b32111514d7ac91ec461d16a1f"
    end
    on_arm do
      url "https://github.com/yuyudhan/nomouse/releases/download/v0.1.22/nomouse-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0965bb3a55ce11ae2978b8c1729546f3ce896e8510874a44805eeaaed4ae526f"
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
