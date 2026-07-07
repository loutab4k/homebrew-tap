class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3.1/openlinear-v0.3.1-darwin-arm64"
      sha256 "dcba8a89333d69c75192373b11b227261200e0da7435c816ef8a1b38ada14102"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3.1/openlinear-v0.3.1-darwin-amd64"
      sha256 "0f8a68c9f65338490727f6e2434571e9ae97e6137c9b8653b2a0c419d7b01e66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3.1/openlinear-v0.3.1-linux-arm64"
      sha256 "5dff882bf6a9ddf096240db36b16da98916121d2f7b8ff1c94737cecb63f81d1"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.3.1/openlinear-v0.3.1-linux-amd64"
      sha256 "4efc515aed76889a07453abcd5ef74399276a439bed11a5d3e7ddf9baf218df8"
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
