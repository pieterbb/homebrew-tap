cask "focus-tracker" do
  version "1.0.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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