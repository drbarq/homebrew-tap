cask "macrelay" do
  version "1.2.2"
  sha256 "c17f1fbce696be33a8aa016ed829bc70f8a37e8b7dbf42bcc622af68e5172b7b"

  url "https://github.com/drbarq/macrelay/releases/download/v#{version}/MacRelay.zip"
  name "MacRelay"
  desc "Open-source MCP server for native macOS apps — with menu bar manager"
  homepage "https://github.com/drbarq/macrelay"

  depends_on macos: ">= :sonoma"

  app "MacRelay.app"

  postflight do
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
