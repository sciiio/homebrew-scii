# typed: false
# frozen_string_literal: true

# scii — the ASCII-native social network, in your terminal.
class Scii < Formula
  desc "ASCII-native social network for the terminal"
  homepage "https://scii.io"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.4.0/scii-darwin-arm64"
      sha256 "1a8f1ec74448054237aa315e2bd81e591201b6f16539e0bd0ecdea73b5c382c3"

      def install
        bin.install "scii-darwin-arm64" => "scii"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.4.0/scii-linux-x64"
      sha256 "487fcf6fd7879de6ff70d0637bb743b3838f65490a60e1ddd35dfcf64856810a"

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
