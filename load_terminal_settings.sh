#!/usr/bin/env bash

cat <<NOTE
Terminal.app writes it's settings out to the plist at exit,
echo so after writing these settings, Terminal.app must be
Terminated with applescript to avoid the system overwriting
with the old values.

NOTE

# Thanks, stackoverflow http://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
while true; do
    read -p "Do you wish to continue? " yn
    case $yn in
        [Yy]* ) break;;
        * ) echo "abort."; exit;;
    esac
done

if [ ! -f ~/Library/Preferences/com.apple.Terminal.plist.bak ] ; then
  cp ~/Library/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist.bak
fi

cp files/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist

osascript <<APPLE
tell application "Terminal" to quit
APPLE
