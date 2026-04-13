cask "macrelay" do
  version "1.1.3"
  sha256 "a63679e1ac35dbbc2ac519e15af958621232f78f3d18416240ad68a3afc48ed0"

  url "https://github.com/drbarq/macrelay/releases/download/v#{version}/MacRelay.zip"
  name "MacRelay"
  desc "Open-source MCP server for native macOS apps — with menu bar manager"
  homepage "https://github.com/drbarq/macrelay"

  depends_on macos: ">= :sonoma"

  app "MacRelay.app"

  postflight do
    system "xattr", "-cr", "#{appdir}/MacRelay.app"
    system "open", "#{appdir}/MacRelay.app"
  end

  uninstall quit: "com.macrelay.app"

  zap trash: [
    "~/Library/Application Support/MacRelay",
    "~/Library/LaunchAgents/com.macrelay.menubar.plist",
    "~/Library/Application Support/Claude/Claude Extensions/com.macrelay.app",
    "~/Library/Application Support/Claude/Claude Extensions Settings/com.macrelay.app.json",
  ]
end
