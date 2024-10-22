class Xctesthtmlreport < Formula
  desc "Xcode-like HTML report for Unit and UI Tests [MONETA]"
  homepage "https://github.com/MONETA-SmartBanka/XCTestHTMLReport"
  url "https://github.com/MONETA-SmartBanka/XCTestHTMLReport/archive/refs/tags/2.5.0.tar.gz"
  sha256 "4e04e4b9b600797d8a41dde27135e87e2ee8a78c3f69a1590aeb7e6c2562e1f7"
  license "MIT"
  head "https://github.com/MONETA-SmartBanka/XCTestHTMLReport.git", branch: "main"

  depends_on :macos
  depends_on xcode: "16.0"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/xchtmlreport"
    bin.install ".build/release/XCTestHTMLReport_XCTestHTMLReport.bundle"
  end

  def post_install
    system "ln -s #{bin}/XCTestHTMLReport_XCTestHTMLReport.bundle #{HOMEBREW_PREFIX}/bin/XCTestHTMLReport_XCTestHTMLReport.bundle"
  end
end
