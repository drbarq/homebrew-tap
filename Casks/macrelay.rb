cask "macrelay" do
  version "1.1.5"
  sha256 "c52eb276de23bed486891ad760237d0a9528d3d4c843165ca58643d20f2373a7"

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
