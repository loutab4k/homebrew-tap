class Openlinear < Formula
  desc "Telegram-native project tracker rendered as one editable rich message"
  homepage "https://github.com/loutab4k/OpenLinear"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.0/openlinear-v0.2.0-darwin-arm64"
      sha256 "533b7215ced6c11ab2ba21e390958647bfd186107dd3e8131c335f82f02ae003"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.0/openlinear-v0.2.0-darwin-amd64"
      sha256 "92461aa888189e37a10852f9150e83d588420b4be6d963f15265bb7f68dbea79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.0/openlinear-v0.2.0-linux-arm64"
      sha256 "f383523a8ea4e89978e7cf49a602e2db1d9bfa213ff9fb4a17e68aecc498ac5b"
    else
      url "https://github.com/loutab4k/OpenLinear/releases/download/v0.2.0/openlinear-v0.2.0-linux-amd64"
      sha256 "406cfe23805f33e8e611d2e75a11505bfc5c76214d2f3f05f72d59d57e1a977f"
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
