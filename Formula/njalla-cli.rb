class NjallaCli < Formula
  desc "Njalla DNS command-line tool with previewed, backed-up record changes"
  homepage "https://github.com/loutab4k/njalla-cli"
  url "https://github.com/loutab4k/njalla-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "191a0078f180945422d9cdd03fb4a12e15c34cb84213b95cd8e806a88ca03413"
  # Keep equal to the repo's LICENSE.
  license "MIT"

  depends_on "go" => :build

  # The module has no third-party dependencies, so no phase needs the network
  # (an offline, GOPROXY=off build gives the same binary).
  deny_network_access!

  def install
    # CGO_ENABLED=0 and -trimpath as in install.sh, plus -s -w. main.go keeps the version in a `const`,
    # which -X cannot set, so the test below is what ties the tag to the binary.
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "njalla-cli #{version}", shell_output("#{bin}/njalla-cli version")

    (testpath/"plan.json").write <<~JSON
      {"version":1,"operations":[{"action":"add","domain":"example.com","record":{"name":"www","type":"A","content":"192.0.2.1","ttl":300}}]}
    JSON
    output = shell_output("#{bin}/njalla-cli validate -plan #{testpath}/plan.json")
    assert_match '"status": "valid"', output
    assert_match '"network_used": false', output
  end
end
