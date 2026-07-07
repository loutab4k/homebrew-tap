class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3/openlinear-v0.3-darwin-arm64"
      sha256 "2055351c1567d1a2efffb6c56fa4b6bdea55e8ab613fc86ea0516813bcd4d35e"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3/openlinear-v0.3-darwin-amd64"
      sha256 "21862ce9708614d46ba8b074a06bc2f30ad5b1a7a9ccee216f61f2a81f326233"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3/openlinear-v0.3-linux-arm64"
      sha256 "b78ef4253d675354bd5c86a02dc9ea73b345d977fa5a4372c542996fa079e230"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3/openlinear-v0.3-linux-amd64"
      sha256 "55569c5ee98fd9b4580b19a23843c2f73cec762942ed83f7439294525371fc6f"
    end
  end

  def install
    bin.install Dir["openlinear-*"].first => "ol"
    bin.install_symlink "ol" => "openlinear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ol version")
  end
end
