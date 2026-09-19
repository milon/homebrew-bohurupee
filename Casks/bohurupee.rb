# This cask installs the current release. Later tags replace it from GoReleaser.
cask "bohurupee" do
  version "0.1.5"

  on_macos do
    on_intel do
      sha256 "bbde20bc0013fc29dc7e48168e4263f1e565032d5c9a746507b26c416e8bfeef"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_darwin_amd64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
    on_arm do
      sha256 "6a25de0a9324d3581d90013715f695c900de0aefb0ef7324e694e54deef5c2eb"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_darwin_arm64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
  end
  on_linux do
    on_intel do
      sha256 "abdfc2f231e80842293bafde36225f6db38a4b2a09a1d159bce0000b18ed7e39"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_linux_amd64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
    on_arm do
      sha256 "f4f33d2295d0c170cffa0c52087edba69c27580a512be0b5e4e598dfc92ab337"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_linux_arm64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
  end

  name "bohurupee"
  desc "Local fake identity provider for OAuth and OIDC development. DEV ONLY."
  homepage "https://github.com/milon/bohurupee"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "bohurupee"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/bohurupee"]
    end
  end

  caveats <<~EOS
    Bohurupee is a local fake identity provider. DEV ONLY.
    It listens on 127.0.0.1:4190.
  EOS
end
