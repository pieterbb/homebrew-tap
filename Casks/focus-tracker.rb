cask "focus-tracker" do
  version "1.0.0"
  sha256 "182e72b72ffcc45fe3a0bf5b4d85d10cb6822f303209ba0e48ede5afd318652f"

  url "https://github.com/pieterbb/focus-tracker/releases/download/#{version}/FocusTracker.app.zip"
  name "Focus Tracker"
  desc "Menu bar app to track and improve focus by monitoring context switching"
  homepage "https://github.com/pieterbb/focus-tracker"

  depends_on macos: ">= :catalina"

  app "Focus Tracker.app"

  uninstall quit: "com.example.focustracker"

  zap trash: [
    "~/Library/Logs/Focus Tracker",
    "~/Library/Preferences/com.example.focustracker.plist",
  ]

  postflight do
    # Create log directory
    system_command "/bin/mkdir", args: ["-p", "#{ENV['HOME']}/Library/Logs/Focus Tracker"]
  end

  caveats <<~EOS
    Focus Tracker requires Accessibility and Screen Recording permissions.
    To grant these permissions:
    1. Open System Preferences
    2. Go to Security & Privacy > Privacy
    3. Add Focus Tracker.app to both:
       - Accessibility
       - Screen Recording
  EOS
end 