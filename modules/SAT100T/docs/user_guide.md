# FlexWave Installer

Professional Windows installer for the FlexWave product suite by XRComm.

## Features

### ✨ Core Capabilities

- **Modular Component Selection**: Choose which FlexWave components to install
  - FlexWave-UI (User Interface)
  - FlexWave-VISA (VISA Bridge Server)
  - FlexWave-Server (Central Coordination Server)
  - FlexWave-SDR (Software-Defined Radio with S8010 driver)
  - FlexWave-Compute (Signal Processing Backend)

- **Automatic Update Checking**: Connects to XRComm update server to check for the latest versions
- **Dependency Validation**: Detects Python, LabVIEW, and existing installations
- **Conflict Resolution**: Identifies and handles installation conflicts
- **LabVIEW Integration**: Automatic installation of LabVIEW instrument drivers
- **Professional UI**: Modern wizard-style interface with XRComm branding

### 🔧 FlexWave-SDR Sub-Components

- **S8010 Device Driver**: Hardware driver for S8010 SDR device
- **Firmware Loading Tool**: Tool for updating device firmware
- **Python Libraries**: Python SDK (`flexwave_sdr` package)
- **LabVIEW Libraries**: LabVIEW VIs for instrument control
  - Automatically detects LabVIEW installation
  - Installs to appropriate `instr.lib` directory
  - Named as "FlexSDR S8010"

## Quick Start

### Using Pre-built Installer

1. Download `FlexWave-Installer-1.0.0.exe`
2. Run as Administrator
3. Follow the installation wizard
4. Select desired components
5. Click Install

### Building from Source

**Using PowerShell:**
```powershell
.\build_installer.ps1 -Clean
```

**Using Python:**
```bash
python build_installer.py --clean
```

## System Requirements

- Windows 10+ (64-bit)
- Administrator privileges
- Python 3.8+ (for Python components)
- LabVIEW 2020+ (optional, for LabVIEW libraries)
- 500 MB free disk space

## Configuration

Edit `installer/config.py` to customize:
- Update server URL
- Component definitions
- Installation paths
- Default selections

## Support

- **Website**: https://www.xrcomm.com/flexwave
- **Support**: https://www.xrcomm.com/support

## License

Proprietary - Copyright © 2025 XRComm