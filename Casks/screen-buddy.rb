cask "screen-buddy" do
  version "1.0.11"
  sha256 "009d08e624d9de111e48825aa71d68e73288f0cceb24e98280bbeb4852b0d16e"

  url "https://github.com/box-kr/screen-buddy/releases/download/v#{version}/ScreenBuddy-#{version}.zip"
  name "ScreenBuddy"
  desc "macOS Menu Bar Utility for monitoring system resources and displaying animated runners"
  homepage "https://github.com/box-kr/screen-buddy"

  app "ScreenBuddy.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/ScreenBuddy.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.andrew.screen-buddy.plist",
  ]
end
