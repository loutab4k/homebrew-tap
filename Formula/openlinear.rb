class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.2/openlinear-v0.2.2-darwin-arm64"
      sha256 "363287ebe1bcfcb21c58a77201e4b4798aeb195f0fd615ce1d64db5ff0328262"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.2/openlinear-v0.2.2-darwin-amd64"
      sha256 "7daacb0281cc6e02e3f9c617f36c720d845e42d2eb5e48f9a2c5b6edc616b233"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.2/openlinear-v0.2.2-linux-arm64"
      sha256 "acc90f1776bbcf69dda8e0af500dd63628a95d5a7c7cbce78a4127be56ae9805"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.2/openlinear-v0.2.2-linux-amd64"
      sha256 "ea3db1763d126db6a156be0399a877ebc55d1e07dcf2db5542588ff2f66feb0c"
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
