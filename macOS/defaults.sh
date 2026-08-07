#!/bin/bash

#
# Keyboard
#

# System preferences range from 2 - 120 (lowest 1)
defaults write NSGlobalDomain KeyRepeat -int 1

# System preferences range from 15 - 120
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable 'smart' quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#
# Keyboard Shortcuts
#

# Show Launchpad (option+a)

# Bear
defaults write -app Bear NSUserKeyEquivalents -dict-add "Move Up" -string "~↑"
defaults write -app Bear NSUserKeyEquivalents -dict-add "Move Down" -string "~↓"
defaults write -app Bear NSUserKeyEquivalents -dict-add "Forward" -string "@]"
defaults write -app Bear NSUserKeyEquivalents -dict-add "Back" -string "@["
defaults write -app Bear NSUserKeyEquivalents -dict-add "Shift Left" -string "@~j"
defaults write -app Bear NSUserKeyEquivalents -dict-add "Shift Right" -string "@~k"

#
# Mac Tiling
#

# 'Window->Fill' '^~↩'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Fill' '~^\\U21a9'

# 'Window->Move & Resize->Left' '^~←'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Left' '~^\\U2190'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Right' '~^\\U2192'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Top' '~^\\U2191'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Bottom' '~^\\U2193'

defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Top Left' '~^u'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Bottom Left' '~^j'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Top Right' '~^i'
defaults write -g NSUserKeyEquivalents -dict-add '\033Window\033Move & Resize\033Bottom Right' '~^k'

#
# Dock
#

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Change the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Make Hidden App Icons Translucent in the Dock
defaults write com.apple.dock showhidden -bool true

# Change minimize window animation
defaults write com.apple.dock mineffect -string "scale"

#
# Mouse/Trackpad
#

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


#
# Battery Percentage
#

# The menuextra domains stopped being read in Big Sur, when the menu bar moved
# under Control Center. Control Center state is per-host, so it needs
# -currentHost; without it the write lands in a domain nothing reads.
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true


#
# Finder
#

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Allow text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder: new window location set to $HOME. Same as Finder > Preferences > New Finder Windows show
# For other path use "PfLo" and "file:///foo/bar/"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"


#
# Safari
#
# Safari's preferences are sandboxed. These writes are no-ops unless the
# terminal running this script has Full Disk Access granted in
# System Settings > Privacy & Security. Set them by hand otherwise.
#

# Show developer tools
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Prevent Safari from opening 'safe' files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Safari opens with all windows from last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false

#
# Mail
#

# Mail --> Viewing --> Show most recent message at the top
defaults write com.apple.mail ConversationViewSortDescending -bool true

#
# Misc
#

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Use tabs
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Menu bar items. These moved from com.apple.systemuiserver to Control Center
# in Big Sur, and they live in the per-host domain, so every write needs
# -currentHost. The module int is the "Show in Menu Bar" dropdown:
#
#   8  = don't show in the menu bar (Control Center only)
#   9  = show when active
#   18 = always show in the menu bar
#
# Don't write the `NSStatusItem Visible <module>` keys in the plain domain.
# ControlCenter maintains those itself as a cache of the ints above — it has
# no `NSStatusItem Visible Sound` at all, because Sound is driven by Sound=18.

# Show volume
defaults -currentHost write com.apple.controlcenter Sound -int 18

# Hide Bluetooth
defaults -currentHost write com.apple.controlcenter Bluetooth -int 8

# Save screenshots to folder
defaults write com.apple.screencapture location "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Screenshots"
# defaults write com.apple.screencapture location "$HOME/Library/CloudStorage/iCloud Drive/Screenshots"
# defaults write com.apple.screencapture location $HOME/Pictures/Screenshots

#
# Apply
#

# Without this the writes above sit in the plists until the next logout.
for app in Dock Finder SystemUIServer ControlCenter; do
    killall "$app" >/dev/null 2>&1
done
echo "Done. Some settings still need a logout to take full effect."

#
# TODO:
#
# General —> Software Update —> Install macOS updates
# Desktop —> Show View Options —> Sort by —> Snap to Grid
# Keyboard —> Keyboard Shortcuts… —> Modifier Keys —> Caps lock escape key
# Mouse —> More Gestures —> Swipe between pages
# Mail —> Settings —> Composing —> Send new messages from
# Photos —> Settings —> iCloud —> Optimize Mac Storage
