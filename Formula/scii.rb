# typed: false
# frozen_string_literal: true

# scii — the ASCII-native social network, in your terminal.
class Scii < Formula
  desc "ASCII-native social network for the terminal"
  homepage "https://scii.io"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.3.1/scii-darwin-arm64"
      sha256 "988c2336a6bc213fd79237f9340a86d93f372e9b71a0e639aad8060b125c3d30"

      def install
        bin.install "scii-darwin-arm64" => "scii"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.3.1/scii-linux-x64"
      sha256 "1131de870f87b7579ac40936c24dca16494d9eeaeef0cc95f5a85c7412825b6b"

      def install
        bin.install "scii-linux-x64" => "scii"
      end
    end
  end

  def caveats
    <<~EOS
      Sign in with Hypery (scan the QR code with your phone):
        scii login
      Then open the feed:
        scii
    EOS
  end

  test do
    assert_match "usage: scii", shell_output("#{bin}/scii help")
  end
end
