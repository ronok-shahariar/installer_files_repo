# Flexwave_VISA_Installer_v1.1.0.exe# FlexWave Installer - Quick Start Guide

## For End Users

### Installation (3 Steps)

1. **Download** `FlexWave-Installer-1.0.0.exe`
2. **Right-click** → "Run as Administrator"
3. **Follow wizard** and select components you want

That's it! 🎉

### What Gets Installed?

- ✅ **FlexWave-UI** - Main interface (always installed)
- 🔧 **FlexWave-VISA** - VISA bridge for instruments
- 🌐 **FlexWave-Server** - Central server (optional)
- 📡 **FlexWave-SDR** - Radio drivers (optional)
  - S8010 hardware driver
  - Firmware update tool
  - Python SDK (`flexwave_sdr`)
  - LabVIEW drivers (if LabVIEW detected)
- ⚡ **FlexWave-Compute** - Signal processing (optional)

### System Requirements

- Windows 10/11 (64-bit)
- 500 MB free disk space
- Python 3.8+ (for Python components)
- LabVIEW 2020+ (for LabVIEW libraries)

---

## For Developers

### Building the Installer

**Quick Build:**
```powershell
.\build_installer.ps1
```

**Clean Build:**
```powershell
.\build_installer.ps1 -Clean
```

**Output:**
- `output/FlexWave-Installer-1.0.0.exe` - Full NSIS installer
- `output/FlexWave-Installer-Standalone.zip` - Portable version

### Project Structure

```
flexsdr-software-installers/
├── installer/          # Installer logic
│   ├── installer_gui.py        # Main GUI
│   ├── update_checker.py       # Update system
│   ├── dependency_checker.py   # System checks
│   └── config.py               # Configuration
├── app/                # FlexWave applications
├── assets/             # Logos, icons
├── build_installer.ps1 # Build script (Windows)
├── build_installer.py  # Build script (cross-platform)
├── FlexWave-Installer.spec  # PyInstaller config
└── FlexWave-Installer.nsi    # NSIS config
```

### Configuration

**Update Server URL:**
Edit `installer/config.py`:
```python
UPDATE_SERVER_URL = "https://updates.xrcomm.com"
```

**Component Settings:**
```python
COMPONENTS = {
    "flexwave-visa": {
        "default_selected": True,
        "size_mb": 100,
        # ...
    }
}
```

### Testing

```bash
# Install dependencies
pip install -r requirements.txt

# Run installer GUI directly (no build needed)
python installer/installer_gui.py

# Test modules
python -c "from installer.dependency_checker import DependencyChecker; print(DependencyChecker().check_all())"
```

---

## Troubleshooting

### Installation Failed

**Problem**: "Insufficient disk space"
- **Fix**: Free up 500+ MB on C: drive

**Problem**: "Python not found"
- **Fix**: Install Python 3.8+ from python.org

**Problem**: "LabVIEW libraries failed"
- **Fix**: Install LabVIEW first, then re-run installer

### Build Failed

**Problem**: "pyinstaller: command not found"
- **Fix**: `pip install pyinstaller`

**Problem**: "NSIS not found"
- **Fix**: Download from https://nsis.sourceforge.io/Download
- Add to PATH: `C:\Program Files (x86)\NSIS`

### Update Check Failed

**Problem**: "Cannot connect to update server"
- **Fix**: Check internet connection
- Verify firewall settings
- Click "Skip Update Check" to continue

---

## Update Server Setup

### Required Endpoints

```
GET  /api/updates/{component}/latest  # Get latest version
GET  /api/components                  # List all components
POST /api/compatibility/check         # Check compatibility
```

### Example Response

```json
{
  "version": "1.2.3",
  "download_url": "https://cdn.xrcomm.com/flexwave-visa-1.2.3.exe",
  "size": 104857600,
  "checksum": "sha256:abc123...",
  "release_date": "2025-01-15T10:30:00Z"
}
```

---

## Key Features

### ✨ What Makes This Installer Special

1. **Modular Selection** - Install only what you need
2. **Smart Updates** - Checks for latest versions automatically
3. **Dependency Detection** - Finds Python, LabVIEW, conflicts
4. **LabVIEW Integration** - Auto-installs to correct instr.lib
5. **Professional UI** - Modern wizard with XRComm branding
6. **Conflict Resolution** - Detects and handles existing installs
7. **Multiple Build Methods** - PyInstaller + NSIS support

### 📊 Installation Paths

```
C:\Program Files\XRComm\
├── FlexWave_VISA\
├── FlexWave_SDR\
│   ├── drivers\S8010\
│   ├── python\flexwave_sdr\
│   └── tools\
├── FlexWave_UI\
├── FlexWave_Server\
└── FlexWave_Compute\

# LabVIEW Libraries:
C:\Program Files\National Instruments\LabVIEW {version}\instr.lib\FlexSDR S8010\
```

---

## Common Commands

### End Users

```powershell
# Run installer
FlexWave-Installer-1.0.0.exe

# Silent install (all components)
FlexWave-Installer-1.0.0.exe /S

# Uninstall
"C:\Program Files\XRComm\uninst.exe"
```

### Developers

```powershell
# Build installer
.\build_installer.ps1 -Clean

# Build PyInstaller only
.\build_installer.ps1 -SkipNSIS

# Run from source
python installer/installer_gui.py

# Install dependencies
pip install -r requirements.txt
```

---

## Support

- 🌐 **Website**: https://www.xrcomm.com/flexwave
- 📧 **Email**: support@xrcomm.com
- 📚 **Docs**: See `DOCUMENTATION.md` for complete guide

---

## License

Copyright © 2025 XRComm. All rights reserved.

---

**Built with ❤️ by XRComm**

*Version 1.0.0 - November 18, 2025*