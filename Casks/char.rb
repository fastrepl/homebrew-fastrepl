cask "char" do
  arch arm: "aarch64", intel: "x86_64"
  version :latest
  sha256 :no_check

  url "https://desktop2.hyprnote.com/download/#{version}/dmg-#{arch}?channel=stable"
  name "Char"
  desc "Char application"
  homepage "https://github.com/fastrepl/hyprnote"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Hyprnote.app"

  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
      args: ["-f", "#{appdir}/Hyprnote.app"]
    system_command "killall", args: ["Dock"], must_succeed: false
  end

  uninstall_postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
      args: ["-u", "#{appdir}/Hyprnote.app"]
    system_command "killall", args: ["Dock"], must_succeed: false
  end
end
