# gRPC_Wrapper_VISA_implement_v1.1.0# FlexWave Installer - Complete Documentation

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Installation](#installation)
4. [Building](#building)
5. [Configuration](#configuration)
6. [Update Server](#update-server)
7. [Troubleshooting](#troubleshooting)
8. [Development](#development)

## Overview

The FlexWave Installer is a professional Windows installer system that provides:

- **Modular Installation**: Select which components to install
- **Update Management**: Automatic checking for component updates
- **Dependency Validation**: Checks for Python, LabVIEW, and conflicts
- **Conflict Resolution**: Detects and handles existing installations
- **LabVIEW Integration**: Automatic installation of LabVIEW drivers

### Components

| Component | Description | Default | Dependencies |
|-----------|-------------|---------|--------------|
| FlexWave-UI | Graphical user interface | ✓ Yes | None |
| FlexWave-VISA | VISA bridge server (gRPC) | ✓ Yes | Python 3.8+ |
| FlexWave-Server | Central coordination server | ✗ No | Python 3.8+ |
| FlexWave-SDR | SDR drivers and libraries | ✗ No | Python 3.8+ |
| FlexWave-Compute | Signal processing backend | ✗ No | Python 3.8+ |

### FlexWave-SDR Sub-Components

- **S8010 Driver** (50 MB): Hardware driver for S8010 device
- **Firmware Tool** (20 MB): Device firmware updater
- **Python Libraries** (30 MB): `flexwave_sdr` Python package
- **LabVIEW Libraries** (100 MB): LabVIEW VIs and instrument drivers

## Architecture

### System Components

```
FlexWave-TruSystems          FlexWave-VISA          FlexWave-UHD
├── SAT100T                  (Bridge Server)        (User Interface)
├── SAT100T-A01                   │                      │
└── SATXXX                        │                      │
         │                        │                      │
         └────────────────────────┴──────────────────────┘
                                  │
                          XRComm Hardware
                    (C1001, C2002, S8010, etc.)
```

### Installer Flow

```
Welcome → System Check → Component Selection → Update Check → 
Path Selection → Installation → Completion
```

### File Structure

```
C:\Program Files\XRComm\
├── FlexWave_VISA\
│   ├── FlexWave-VISA.exe
│   ├── config.yml
│   ├── bridge\
│   ├── proto\
│   └── version.txt
├── FlexWave_SDR\
│   ├── drivers\
│   │   └── S8010\
│   ├── tools\
│   │   └── firmware_loader.exe
│   ├── python\
│   │   └── flexwave_sdr\
│   └── labview\
│       └── FlexSDR S8010\
├── FlexWave_UI\
├── FlexWave_Server\
└── FlexWave_Compute\
```

## Installation

### End User Installation

1. **Download Installer**
   ```
   FlexWave-Installer-1.0.0.exe
   ```

2. **Run as Administrator**
   - Right-click → "Run as Administrator"
   - Or: Open cmd/PowerShell as admin and run directly

3. **Follow Wizard**
   - **Welcome**: Read introduction
   - **System Check**: Automatic dependency checking
   - **Components**: Select what to install
   - **Update Check**: Check for latest versions
   - **Path**: Choose installation location
   - **Install**: Watch progress
   - **Finish**: Launch applications

### Silent Installation

```powershell
# Install all components silently
FlexWave-Installer-1.0.0.exe /S

# Install specific components
FlexWave-Installer-1.0.0.exe /S /D=C:\Custom\Path
```

### Uninstallation

**Method 1: Windows Settings**
```
Settings → Apps → FlexWave → Uninstall
```

**Method 2: Control Panel**
```
Control Panel → Programs → Uninstall a program → FlexWave
```

**Method 3: Command Line**
```powershell
"C:\Program Files\XRComm\uninst.exe" /S
```

## Building

### Prerequisites

- **Python 3.8+** with pip
- **PyInstaller 5.0+**
- **NSIS 3.x** (optional, for advanced installer)
- **Git** (for version control)

### Build Methods

#### Method 1: PowerShell Script (Recommended)

```powershell
# Full clean build
.\build_installer.ps1 -Clean

# Quick build
.\build_installer.ps1

# PyInstaller only
.\build_installer.ps1 -SkipNSIS

# NSIS only (reuse existing dist/)
.\build_installer.ps1 -SkipPyInstaller
```

#### Method 2: Python Script

```bash
# Full clean build
python build_installer.py --clean

# Quick build
python build_installer.py

# PyInstaller only
python build_installer.py --skip-nsis
```

#### Method 3: Manual Build

```bash
# Install dependencies
pip install -r requirements.txt

# Build PyInstaller executable
pyinstaller --clean --noconfirm FlexWave-Installer.spec

# Compile NSIS installer (Windows only)
makensis FlexWave-Installer.nsi
```

### Build Output

```
output/
├── FlexWave-Installer-1.0.0.exe  # NSIS installer (if built)
├── FlexWave-Standalone/           # Standalone package
│   ├── FlexWave-Installer.exe
│   ├── assets/
│   ├── README.md
│   └── INSTALLER_INFO.txt
└── FlexWave-Installer-Standalone.zip  # Zipped package
```

### Troubleshooting Build Issues

**PyInstaller errors:**
```bash
# Clear PyInstaller cache
pyinstaller --clean FlexWave-Installer.spec

# Verbose output
pyinstaller --log-level DEBUG FlexWave-Installer.spec
```

**NSIS errors:**
```powershell
# Check NSIS installation
makensis /VERSION

# Verbose compilation
makensis /V4 FlexWave-Installer.nsi
```

## Configuration

### Component Configuration

Edit `installer/config.py`:

```python
COMPONENTS = {
    "flexwave-visa": {
        "display_name": "FlexWave-VISA",
        "description": "VISA bridge server...",
        "default_selected": True,  # Install by default
        "required": False,          # Not required
        "install_path": "FlexWave_VISA",
        "size_mb": 100,
        "shortcuts": ["Start Menu", "Desktop"],
        "dependencies": ["python"]
    },
    # Add more components...
}
```

### Update Server Configuration

```python
UPDATE_SERVER_URL = "https://updates.xrcomm.com"
```

### Installation Paths

```python
DEFAULT_INSTALL_ROOT = "C:\\Program Files\\XRComm"
```

### Branding

```python
COMPANY_NAME = "XRComm"
PRODUCT_NAME = "FlexWave"
WINDOW_TITLE = "FlexWave Installer"
PUBLISHER = "XRComm"
SUPPORT_URL = "https://www.xrcomm.com/support"
```

## Update Server

### Required Endpoints

#### 1. Get Latest Version

```http
GET /api/updates/{component}/latest

Headers:
  User-Agent: FlexWave-Installer/1.0.0
  X-Current-Version: 1.0.0

Response 200:
{
  "version": "1.2.3",
  "download_url": "https://cdn.xrcomm.com/flexwave-visa-1.2.3.exe",
  "release_notes": "Bug fixes and improvements",
  "size": 104857600,
  "checksum": "sha256:abc123...",
  "release_date": "2025-01-15T10:30:00Z"
}
```

#### 2. Get All Components

```http
GET /api/components

Response 200:
{
  "flexwave-visa": {
    "latest_version": "1.0.0",
    "versions": ["1.0.0", "0.9.5", "0.9.0"],
    "description": "VISA Bridge Server"
  },
  "flexwave-sdr": {
    "latest_version": "1.2.0",
    "versions": ["1.2.0", "1.1.0"],
    "description": "Software-Defined Radio"
  }
}
```

#### 3. Check Compatibility

```http
POST /api/compatibility/check

Request:
{
  "flexwave-visa": "1.0.0",
  "flexwave-sdr": "1.2.0",
  "flexwave-ui": "1.0.0"
}

Response 200:
{
  "compatible": true,
  "warnings": [
    "FlexWave-SDR 1.2.0 requires Python 3.9+"
  ],
  "errors": []
}
```

### Server Implementation Example

```python
from flask import Flask, jsonify, request

app = Flask(__name__)

VERSIONS = {
    "flexwave-visa": {
        "latest": "1.0.0",
        "download_url": "https://...",
        "size": 104857600,
        "checksum": "sha256:..."
    }
}

@app.route('/api/updates/<component>/latest')
def get_latest(component):
    if component not in VERSIONS:
        return jsonify({"error": "Component not found"}), 404
    
    return jsonify({
        "version": VERSIONS[component]["latest"],
        "download_url": VERSIONS[component]["download_url"],
        "size": VERSIONS[component]["size"],
        "checksum": VERSIONS[component]["checksum"],
        "release_date": "2025-01-15T10:30:00Z"
    })

@app.route('/api/components')
def get_components():
    return jsonify(VERSIONS)
```

## Troubleshooting

### Installation Issues

#### Error: "Insufficient disk space"

**Cause**: Less than 500 MB available on C: drive

**Solution**:
- Free up disk space
- Or install to different drive
- Check temp folder: `C:\Users\{user}\AppData\Local\Temp`

#### Error: "Python not found"

**Cause**: Python not installed or not in PATH

**Solution**:
```powershell
# Check Python installation
python --version

# Add to PATH (if installed but not found)
$env:Path += ";C:\Python310"

# Or install Python
winget install Python.Python.3.11
```

#### Error: "LabVIEW libraries installation failed"

**Cause**: LabVIEW not installed or not detected

**Solution**:
- Install LabVIEW first
- Check registry: `HKLM\Software\National Instruments\LabVIEW`
- Manually copy VIs to: `C:\Program Files\National Instruments\LabVIEW 20XX\instr.lib\`

#### Warning: "Existing installation found"

**Cause**: Previous FlexWave version installed

**Solution**:
1. Uninstall old version first
2. Or choose "Upgrade" option
3. Or install to different directory

### Update Check Issues

#### Error: "Update server unreachable"

**Cause**: Network issues or wrong URL

**Solution**:
```powershell
# Test connectivity
Test-NetConnection updates.xrcomm.com -Port 443

# Check firewall
Get-NetFirewallRule | Where-Object {$_.DisplayName -like "*FlexWave*"}

# Verify URL in config
Get-Content installer\config.py | Select-String "UPDATE_SERVER_URL"
```

#### Error: "SSL certificate verification failed"

**Cause**: Corporate proxy or self-signed certificate

**Solution**:
```python
# Temporarily disable verification (NOT RECOMMENDED for production)
# Edit update_checker.py:
response = requests.get(url, verify=False)
```

### Build Issues

#### PyInstaller: "Module not found"

**Cause**: Missing hidden imports

**Solution**:
```python
# Add to FlexWave-Installer.spec
hiddenimports = [
    'PyQt5.QtCore',
    'missing_module_name',
]
```

#### NSIS: "File not found"

**Cause**: Files not in expected location

**Solution**:
```nsis
# Check paths in FlexWave-Installer.nsi
File /r "dist\app\*.*"  # Verify this path exists
```

## Development

### Project Setup

```bash
# Clone repository
git clone https://github.com/xrcomm/flexsdr-software-installers.git
cd flexsdr-software-installers

# Create virtual environment
python -m venv venv
.\venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Running from Source

```bash
# Run installer GUI
python installer/installer_gui.py

# Run specific modules
python -m installer.dependency_checker
python -m installer.update_checker
```

### Testing

```python
# Test dependency checker
from installer.dependency_checker import DependencyChecker

checker = DependencyChecker()
results = checker.check_all()
print(results)

# Test update checker
from installer.update_checker import UpdateChecker

checker = UpdateChecker("https://updates.xrcomm.com", "1.0.0")
available, info = checker.check_for_updates("flexwave-visa")
print(f"Update available: {available}")
```

### Adding New Components

1. **Define in config.py:**
```python
COMPONENTS["new-component"] = {
    "display_name": "New Component",
    "description": "Description...",
    "default_selected": False,
    "size_mb": 50,
    "install_path": "New_Component",
    "dependencies": ["python"]
}
```

2. **Update NSIS script:**
```nsis
Section "New Component" SEC_NEW
  SetOutPath "$INSTDIR\New_Component"
  File /r "dist\new_component\*.*"
SectionEnd
```

3. **Add to build process:**
- Include files in PyInstaller spec
- Add installation logic
- Create shortcuts if needed

### Code Style

- **Python**: PEP 8
- **Documentation**: Google style docstrings
- **Formatting**: Black (line length 100)
- **Type hints**: Use where appropriate

### Git Workflow

```bash
# Create feature branch
git checkout -b feature/new-component

# Make changes and commit
git add .
git commit -m "Add new component"

# Push and create PR
git push origin feature/new-component
```

## API Reference

### DependencyChecker

```python
from installer.dependency_checker import DependencyChecker

checker = DependencyChecker()

# Check all dependencies
results = checker.check_all()
# Returns: {python: {...}, labview: {...}, existing_installations: {...}}

# Check specific items
python_info = checker.check_python()
labview_info = checker.check_labview()
disk_info = checker.check_disk_space(required_mb=500)
has_admin = checker.check_admin_rights()
```

### UpdateChecker

```python
from installer.update_checker import UpdateChecker

checker = UpdateChecker(
    update_server_url="https://updates.xrcomm.com",
    current_version="1.0.0"
)

# Check for updates
available, info = checker.check_for_updates("flexwave-visa")

# Download update
success = checker.download_update(
    update_info=info,
    destination="C:\\Temp\\update.exe",
    progress_callback=lambda done, total: print(f"{done}/{total}")
)
```

## FAQ

### Q: Can I install only specific components?

**A:** Yes, the installer allows you to select which components to install.

### Q: Do I need administrator privileges?

**A:** Yes, for system-wide installation. LabVIEW driver installation requires admin rights.

### Q: Can I install to a custom location?

**A:** Yes, you can browse and select a custom installation directory.

### Q: How do I upgrade from a previous version?

**A:** Run the installer. It will detect existing installations and offer to upgrade.

### Q: Can I install without internet?

**A:** Yes, but update checking will be skipped.

### Q: What if Python is not installed?

**A:** Python-dependent components will be unavailable or may fail. Install Python first.

## Support

### Contact

- **Email**: support@xrcomm.com
- **Website**: https://www.xrcomm.com/support
- **Phone**: +1-XXX-XXX-XXXX

### Resources

- **Documentation**: https://docs.xrcomm.com/flexwave
- **Knowledge Base**: https://support.xrcomm.com/kb
- **Community Forum**: https://community.xrcomm.com

## License

Copyright © 2025 XRComm. All rights reserved.

This is proprietary software. Unauthorized copying, distribution, or modification is strictly prohibited.

---

**Last Updated**: November 18, 2025
**Version**: 1.0.0