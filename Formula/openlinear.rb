class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.1.0/openlinear-v0.1.0-darwin-arm64"
      sha256 "c4b3bd2ca97b27a32f3f6fdfb9117b5ad5d872c406db0a6bcb4ed01a61c78031"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.1.0/openlinear-v0.1.0-darwin-amd64"
      sha256 "dcd2018ec99e0319c9903c70ca54e1d5b0c83b4009642478e0dde8c2ee5c2411"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.1.0/openlinear-v0.1.0-linux-arm64"
      sha256 "74db32bd198569ba2074681112d3984c856330f61d58f70874a102744e226898"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.1.0/openlinear-v0.1.0-linux-amd64"
      sha256 "4b3eebf6cde5c1b8e4f7f02db348277eefa9b19ff726cafa11e709a0c948ccd7"
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
