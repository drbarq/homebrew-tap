cask "macrelay" do
  version "1.2.6"
  sha256 "935289f155a8c96f62505dd9e613bb5a46857934ec0bccf707781ea23fab77db"

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
