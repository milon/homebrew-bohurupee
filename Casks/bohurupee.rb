# This cask installs the v0.1 release. Later tags replace it from GoReleaser.
cask "bohurupee" do
  version "0.1"

  on_macos do
    on_intel do
      sha256 "3772f99f013d9a70493deb193483981f215282b58545b5cb2b182bef80718f96"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_darwin_amd64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
    on_arm do
      sha256 "80cfce4d14782dfccf2af44ee08b52e49f17d596946da164c08ef0bf3ad922c6"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_darwin_arm64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
  end
  on_linux do
    on_intel do
      sha256 "51fb58a610dfaa0d6d649e87fa8386280b1b24c8b1581f1ae556faaae89f5a20"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_linux_amd64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
    on_arm do
      sha256 "0182a912b21352ac8ec2e03aef7222d96928c2e71818af3fd1739bf7710e376a"
      url "https://github.com/milon/bohurupee/releases/download/v#{version}/bohurupee_#{version}_linux_arm64.tar.gz",
          verified: "github.com/milon/bohurupee/"
    end
  end

  name "bohurupee"
  desc "Local fake identity provider for OAuth and OIDC development. DEV ONLY."
  homepage "https://github.com/milon/bohurupee"

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
