#!/bin/bash

# Set computer name
name=$1
sudo scutil --set ComputerName "$name"
sudo scutil --set HostName "$name.local"
sudo scutil --set LocalHostName "$name"

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
# Dock
#

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Change the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0

# Make Hidden App Icons Translucent in the Dock
defaults write com.apple.Dock showhidden -bool true

# Change minimize window animation
defaults write com.apple.Dock mineffect -string "scale"

#
# Mouse/Trackpad
#

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


#
# Battery Percentage
#

defaults write com.apple.menuextra.battery ShowPercent -bool true


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

# Show developer tools
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Prevent Safari from opening 'safe' files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Ask websites not to track me
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Safari opens with all windows from last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false


#
# Misc
#

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Use tabs
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Show volume in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true

# Show Bluetooth in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 1

# Save screenshots to folder
mkdir "$HOME/Library/Mobile Documents/com~apple~CloudDocs/screenshots"
efaults write com.apple.screencapture location "$HOME/Library/Mobile Documents/com~apple~CloudDocs/screenshots"

#
# TODO:
#
# App Store —> Install macOS updates
# App Store —> Free Downloads —> Save password
# Desktop -> Sort by -> Snap to Grid
# iTunes —> Preferences —> Devices —> Prevent iPods, iPhones, and iPads from syncing automatically
# Keyboard —> Modifier Keys —> Caps lock escape key
# Mouse --> Swipe between pages
# Mail --> Composing --> Send new messages from
# Mail --> Viewing --> Show most recent message at the top
# Photos —> Optimize for mac storage
# Security & Privacy —> General —> Require password 5 secs
