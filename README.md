# homebrew-filecast

Homebrew tap for [filecast](https://github.com/gistrec/filecast) — send a file
to every machine on your LAN at once over UDP broadcast/multicast.

```sh
brew install gistrec/filecast/filecast
```

Or tap first, then install:

```sh
brew tap gistrec/filecast
brew install filecast
```

On Homebrew 6 and newer you may be prompted to trust the tap the first time:

```sh
brew trust gistrec/filecast
```

Installs a prebuilt binary from the
[filecast releases](https://github.com/gistrec/filecast/releases): a universal
binary on macOS (Apple Silicon + Intel) and per-architecture binaries on Linux
(x86_64, arm64).
