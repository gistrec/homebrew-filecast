class Filecast < Formula
  desc "Send a file to every machine on your LAN at once over UDP broadcast/multicast"
  homepage "https://github.com/gistrec/filecast"
  # The top-level url is the macOS universal binary (Apple Silicon + Intel);
  # Linux overrides it per architecture below.
  url "https://github.com/gistrec/filecast/releases/download/v1.1.0/filecast-macos-universal"
  sha256 "35c199ab03e7a933dd1262b1b06159ffe001b64154e86ca87173e82847c9779c"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/gistrec/filecast/releases/download/v1.1.0/filecast-linux-x86_64"
      sha256 "b5b96337c3b748bdd9528706af0a76b0b0fea0a11a62e49c69439f430fb774c7"
    end
    on_arm do
      url "https://github.com/gistrec/filecast/releases/download/v1.1.0/filecast-linux-arm64"
      sha256 "389d5f17af4689bfec4125cc15c5d8be4d510c469374894162a30d4f8223b798"
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
