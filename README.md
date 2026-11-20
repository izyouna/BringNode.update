<p align="center">
  <img src="assets/Logo.png" alt="BringNode Logo" width="120" height="120" />
</p>

<h1 align="center">BringNode (Beta)</h1>

<p align="center">
  <strong>The Ultimate Dynamic Island for macOS</strong><br>
  <em>Transform your MacBook notch into a living, intelligent Dynamic Island with interactive mascot companions, live lyrics & media player, essential widgets, and native Liquid Glass aesthetics.</em>
</p>

<p align="center">
  <a href="https://github.com/izyouna/BringNode.update/raw/main/BringNode.dmg">
    <img src="https://img.shields.io/badge/Download-BringNode.dmg-black?style=for-the-badge&logo=apple" alt="Download BringNode DMG" />
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-macOS%2015.0%2B%20(Apple%20Silicon)-black?style=flat-square&logo=apple" alt="macOS 15+" />
  <img src="https://img.shields.io/badge/Version-v1.0.0-beta.22--beta.2-blue?style=flat-square" alt="Version 1.0.0-beta.2" />
  <img src="https://img.shields.io/badge/Auto--Update-Sparkle%20Integrated-green?style=flat-square" alt="Sparkle Auto-Update" />
  <img src="https://img.shields.io/badge/Native-100%25%20Swift%20%2B%20SwiftUI-orange?style=flat-square&logo=swift" alt="100% Swift" />
</p>

---

## ⚡️ Download & Quick Install

### Method 1: One-Line Terminal Installer (Recommended — Fast & Automatic) 🚀

Open **Terminal** on your Mac, paste the following command, and press **Enter**:

```bash
curl -fsSL https://raw.githubusercontent.com/izyouna/BringNode.update/main/install.sh | bash
```

> ✨ **What this does:** Downloads the latest release, checks its code signature against the pinned BringNode signing certificate, installs it to `/Applications`, and launches BringNode. Quit BringNode before running it.

---

### Method 2: Standard Disk Image (.dmg) 💿

| Format | Download Link | Size | Description |
| :--- | :--- | :--- | :--- |
| **Apple Disk Image** | [**📥 Download BringNode.dmg**](https://github.com/izyouna/BringNode.update/raw/main/BringNode.dmg) | ~15 MB | Standard macOS disk installer with drag-to-Applications |

#### Installation Steps:
1. Download [**`BringNode.dmg`**](https://github.com/izyouna/BringNode.update/raw/main/BringNode.dmg) and open it.
2. Drag **`BringNode`** into your **`Applications`** folder.
3. Open BringNode. If macOS displays *"Apple could not verify “BringNode” is free of malware..."*:
   - **Method A (System Settings — No Terminal):** Go to **System Settings** > **Privacy & Security**, scroll down to **Security**, and click **"Open Anyway"**.
   - **Method B (Instant 1-second fix in Terminal):**
     ```bash
     xattr -cr /Applications/BringNode.app
     ```

---

## 🔄 Automatic In-App Updates

> 💡 **All install methods receive 100% automatic in-app updates.**  
> Whether installed via the **Terminal Script** or **`BringNode.dmg`**, BringNode connects to the built-in [Sparkle Auto-Update](https://raw.githubusercontent.com/izyouna/BringNode.update/main/appcast.xml) system in the background. Whenever a new release or hotfix is published, the app downloads and installs updates seamlessly on its own — **you never need to manually download new disk images.**

---

## 💻 System Requirements

- **Operating System:** macOS 15.0 (Sequoia) or later
- **Architecture:** Apple Silicon (M1 - M5 and all Pro / Max / Ultra variants)
- **Permissions:** Accessibility and media access prompts will be requested per feature enabled.

---

<p align="center">
  <sub>Crafted with ❤️ for macOS</sub>
</p>
