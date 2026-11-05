#!/bin/bash
# One-line installer for BringNode (macOS)
# Downloads latest BringNode, installs to /Applications, removes Gatekeeper quarantine, and launches.
set -euo pipefail

echo ""
echo "=========================================================="
echo "🏝️  Installing BringNode for macOS..."
echo "=========================================================="
echo ""

TMP_DIR=$(mktemp -d /tmp/potch-install.XXXXXX)
cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

DMG_URL="https://github.com/izyouna/BringNode.update/raw/main/BringNode.dmg"

echo "==> 1. Downloading latest BringNode.dmg..."
curl -fL --progress-bar "$DMG_URL" -o "$TMP_DIR/BringNode.dmg"

echo "==> 2. Mounting disk image..."
MOUNT_DIR="$TMP_DIR/mount"
mkdir -p "$MOUNT_DIR"
hdiutil attach "$TMP_DIR/BringNode.dmg" -nobrowse -mountpoint "$MOUNT_DIR" -quiet

echo "==> 3. Installing to /Applications..."
pkill -f "/Applications/BringNode.app/Contents/MacOS/BringNode" 2>/dev/null || true
rm -rf /Applications/BringNode.app
cp -R "$MOUNT_DIR/BringNode.app" /Applications/

echo "==> 4. Unmounting disk image..."
hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null || true

echo "==> 5. Bypassing macOS Gatekeeper quarantine..."
xattr -cr /Applications/BringNode.app 2>/dev/null || true

echo "==> 6. Launching BringNode..."
open /Applications/BringNode.app

echo ""
echo "=========================================================="
echo "✅ BringNode has been installed and launched successfully!"
echo "   Location: /Applications/BringNode.app"
echo "=========================================================="
echo ""
