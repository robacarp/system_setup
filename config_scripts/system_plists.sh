# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable tap to click for current user and the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Save to disk by default (vs iCloud)
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Guest Account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled 0
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# My hot corner config:
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-br-corner -int 4

# I have no idea what these do:
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Finder view tweaks
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowPreviewPane -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowTabView -bool false
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarSharedSectionDisclosedState -bool true
defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool false

# dock view tweaks
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock tilesize -int 128
defaults write com.apple.dock trash-full -bool true

# time machine settings
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
sudo tmutil addexclusion $HOME/Dropbox
sudo tmutil addexclusion $HOME/Downloads
sudo tmutil addexclusion $HOME/Desktop
