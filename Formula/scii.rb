# typed: false
# frozen_string_literal: true

# scii — the ASCII-native social network, in your terminal.
class Scii < Formula
  desc "ASCII-native social network for the terminal"
  homepage "https://scii.io"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.2.0/scii-darwin-arm64"
      sha256 "32cca2fd65e805713e53e56d6da3bd26c9dc048e4f95ea711c4e1a96999c2782"

      def install
        bin.install "scii-darwin-arm64" => "scii"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sciiio/scii-releases/releases/download/v0.2.0/scii-linux-x64"
      sha256 "743683f2b29b5389b2f76dca51e4db3f0bff9d0daca889b07c899e476270d74f"

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
