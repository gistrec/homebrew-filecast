class Filecast < Formula
  desc "Send a file to every machine on your LAN at once over UDP broadcast/multicast"
  homepage "https://github.com/gistrec/filecast"
  # The top-level url is the macOS universal binary (Apple Silicon + Intel);
  # Linux overrides it per architecture below.
  url "https://github.com/gistrec/filecast/releases/download/v1.0.0/filecast-macos-universal"
  sha256 "21fafc090d20530c95e4939c7182cd7ccf6805cc870fbf3d14f312bd648bd142"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/gistrec/filecast/releases/download/v1.0.0/filecast-linux-x86_64"
      sha256 "bfa1a78a89c61fe6f3c98f3ea9079147c8962b07a1710473a79cb5027d57e452"
    end
    on_arm do
      url "https://github.com/gistrec/filecast/releases/download/v1.0.0/filecast-linux-arm64"
      sha256 "541baa3cbc23bcd2bb7b9738fcfa139fa270522c81c3256528cf4d9429bf9bb5"
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
