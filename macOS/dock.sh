dockutil --remove all

dockutil --add /Applications/Safari.app
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/Microsoft\ Outlook.app
dockutil --add /System/Applications/Messages.app
dockutil --add /Applications/WhatsApp.app
dockutil --add /Applications/Slack.app
dockutil --add /System/Applications/News.app
dockutil --add /System/Applications/Music.app
dockutil --add /Applications/Bear.app
dockutil --add /Applications/iTerm.app
dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /Applications/Xcode.app
dockutil --add /Applications/DataGrip.app
dockutil --add "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Screenshots" --view grid --display stack --sort dateadded
# dockutil --add "$HOME/Library/CloudStorage/iCloud Drive/Screenshots" --view grid --display stack --sort dateadded
dockutil --add "$HOME/Downloads" --view grid --display stack --sort dateadded
