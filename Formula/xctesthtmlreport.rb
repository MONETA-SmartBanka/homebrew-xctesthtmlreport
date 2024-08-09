class Xctesthtmlreport < Formula
  desc "Xcode-like HTML report for Unit and UI Tests [MONETA]"
  homepage "https://github.com/MONETA-SmartBanka/XCTestHTMLReport"
  url "https://github.com/MONETA-SmartBanka/XCTestHTMLReport/archive/refs/tags/2.2.5.tar.gz"
  sha256 "3c7f9f85ae550b9f3138734a44db068fcd42b720f6e18370af3e767d02363019"
  license "MIT"
  head "https://github.com/MONETA-SmartBanka/XCTestHTMLReport.git", branch: "main"

  depends_on :macos
  depends_on xcode: "14.0"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/xchtmlreport"
    bin.install ".build/release/XCTestHTMLReport_XCTestHTMLReport.bundle"
    system "ln -s #{bin}/XCTestHTMLReport_XCTestHTMLReport.bundle #{HOMEBREW_PREFIX}/bin/XCTestHTMLReport_XCTestHTMLReport.bundle"
  end
end

