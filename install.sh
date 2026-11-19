#!/bin/bash
# Verified first installation; never remove quarantine or disable Gatekeeper.
set -euo pipefail
BRINGNODE_INSTALL_TMP=$(mktemp -d /tmp/bringnode-install.XXXXXX)
BRINGNODE_INSTALL_MOUNT="$BRINGNODE_INSTALL_TMP/mount"
BRINGNODE_INSTALL_STAGE=""
cleanup() {
    hdiutil detach "$BRINGNODE_INSTALL_MOUNT" -quiet 2>/dev/null || true
    if [ -n "$BRINGNODE_INSTALL_STAGE" ]; then rm -rf "$BRINGNODE_INSTALL_STAGE"; fi
    rm -rf "$BRINGNODE_INSTALL_TMP"
}
trap cleanup EXIT
if pgrep -x BringNode >/dev/null; then
    echo "Quit BringNode before installing, then run this installer again." >&2
    exit 1
fi
curl --fail --location --proto '=https' --proto-redir '=https' 'https://github.com/izyouna/BringNode.update/raw/main/BringNode.dmg' -o "$BRINGNODE_INSTALL_TMP/BringNode.dmg"
mkdir "$BRINGNODE_INSTALL_MOUNT"
hdiutil attach "$BRINGNODE_INSTALL_TMP/BringNode.dmg" -readonly -nobrowse -mountpoint "$BRINGNODE_INSTALL_MOUNT" -quiet
BRINGNODE_INSTALL_APP="$BRINGNODE_INSTALL_MOUNT/BringNode.app"
codesign --verify --deep --strict "$BRINGNODE_INSTALL_APP"
BRINGNODE_INSTALL_SIGNATURE=$(codesign -dvvv "$BRINGNODE_INSTALL_APP" 2>&1)
if ! printf '%s\n' "$BRINGNODE_INSTALL_SIGNATURE" | grep -q '^Authority=Developer ID Application:' ||
   ! printf '%s\n' "$BRINGNODE_INSTALL_SIGNATURE" | grep -q '^TeamIdentifier=256AUJ9555$' ||
   ! printf '%s\n' "$BRINGNODE_INSTALL_SIGNATURE" | grep -Eq 'flags=0x[0-9a-f]+\([^)]*runtime'; then
    echo "The downloaded app does not have the expected production signature." >&2
    exit 1
fi
if [ "$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$BRINGNODE_INSTALL_APP/Contents/Info.plist")" != 'com.bringnode.app' ]; then
    echo "Unexpected application identity." >&2; exit 1
fi
spctl --assess --type execute --verbose=2 "$BRINGNODE_INSTALL_APP"
BRINGNODE_INSTALL_STAGE=$(mktemp -d /Applications/.BringNode-install.XXXXXX)
ditto "$BRINGNODE_INSTALL_APP" "$BRINGNODE_INSTALL_STAGE/BringNode.app"
codesign --verify --deep --strict "$BRINGNODE_INSTALL_STAGE/BringNode.app"
if [ -e /Applications/BringNode.app ]; then mv /Applications/BringNode.app "$BRINGNODE_INSTALL_STAGE/Previous.app"; fi
if ! mv "$BRINGNODE_INSTALL_STAGE/BringNode.app" /Applications/BringNode.app; then
    if [ -e "$BRINGNODE_INSTALL_STAGE/Previous.app" ]; then mv "$BRINGNODE_INSTALL_STAGE/Previous.app" /Applications/BringNode.app; fi
    exit 1
fi
open /Applications/BringNode.app
