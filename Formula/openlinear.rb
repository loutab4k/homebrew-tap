class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.1/openlinear-v0.2.1-darwin-arm64"
      sha256 "4f4e59fd53f7d550ba3958f7adfc7e43bdf9e208f977a2a1f86474449701f327"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.1/openlinear-v0.2.1-darwin-amd64"
      sha256 "6edc6a50dddcdc5c80b9aa5a6708d81571a402c5ff5ce7baace91f513fbd319b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.1/openlinear-v0.2.1-linux-arm64"
      sha256 "1500f2dfc046cae89029d6803778914fece030a8aab11717a2f849f716706809"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.1/openlinear-v0.2.1-linux-amd64"
      sha256 "63da7a67fb820acaa0a6221f605cea997235c7605492c185e80162188822ffc6"
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
