cask "4k-video-downloader" do
  version "4.31.1"
  sha256 "e5ea87b76b7a50b6c09d370b86d7e438ac378e987252432d0172e42b74bb514a"

  url "https://dl.4kdownload.com/app/4kvideodownloader_#{version.major_minor_patch}_x64.dmg"
  name "4K Video Downloader"
  desc "Free video downloader"
  homepage "https://www.4kdownload.com/products/product-videodownloader"

  livecheck do
    url "https://www.4kdownload.com/download"
    regex(%r{href=.*?/4kvideodownloader[._-]v?(\d+(?:\.\d+)+)[^"' >]*?\.dmg}i)
  end

  depends_on macos: ">= :high_sierra"

  app "4K Video Downloader.app"

  zap trash: [
    "~/Library/Application Support/4kdownload.com/4K Video Downloader",
    "~/Library/Preferences/com.4kdownload.4K Video Downloader.plist",
    "~/Library/Preferences/com.4kdownload.ApplicationDirectories.plist",
    "~/Library/Preferences/com.openmedia.4kvideodownloader.plist",
    "~/Library/Saved Application State/com.openmedia.4kvideodownloader.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
