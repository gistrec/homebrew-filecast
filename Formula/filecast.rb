class Filecast < Formula
  desc "Send a file to every machine on your LAN at once over UDP broadcast/multicast"
  homepage "https://github.com/gistrec/filecast"
  # The top-level url is the macOS universal binary (Apple Silicon + Intel);
  # Linux overrides it per architecture below.
  url "https://github.com/gistrec/filecast/releases/download/v1.2.0/filecast-macos-universal"
  sha256 "1ed9604e0b02dd12f43463e519e1946e515f5dafc5076d355f3c24da7d8dae05"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/gistrec/filecast/releases/download/v1.2.0/filecast-linux-x86_64"
      sha256 "533e3a581ef5363eddaddefc02a094c9743f6eff5e02bf14ab50b1137cfd0304"
    end
    on_arm do
      url "https://github.com/gistrec/filecast/releases/download/v1.2.0/filecast-linux-arm64"
      sha256 "8f52f4f0236947deeb0430f31b61e7f3fccd7091dafee744e5efb11404b4cbfe"
    end
  end

  def install
    # The release asset is the bare binary; it is the only file staged here.
    bin.install Dir["*"].first => "filecast"
  end

  test do
    assert_match "filecast #{version}", shell_output("#{bin}/filecast --version")
  end
end
