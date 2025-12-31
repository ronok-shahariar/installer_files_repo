# gRPC_Wrapper_VISA_implement_v1.0.0# FlexWave Installer - System Architecture

## Overview Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                      FlexWave Installer System                       │
│                          (Version 1.0.0)                             │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                    ┌───────────────┴───────────────┐
                    │                               │
            ┌───────▼────────┐             ┌───────▼────────┐
            │  Build System  │             │  Runtime System │
            └───────┬────────┘             └───────┬─────────┘
                    │                               │
        ┌───────────┴───────────┐       ┌──────────┴──────────┐
        │                       │       │                     │
   ┌────▼────┐           ┌─────▼─────┐ │              ┌─────▼─────┐
   │PyInstaller│         │   NSIS    │ │              │Installer   │
   │  .spec   │         │   .nsi    │ │              │   GUI      │
   └────┬────┘           └─────┬─────┘ │              └─────┬─────┘
        │                       │       │                     │
        │    ┌──────────────────┘       │         ┌──────────┴──────────┐
        │    │                          │         │                     │
        ▼    ▼                          │    ┌────▼────┐         ┌─────▼─────┐
   ┌─────────────┐                     │    │Update   │         │Dependency │
   │Executable   │                     │    │Checker  │         │ Checker   │
   │   .exe      │                     │    └────┬────┘         └─────┬─────┘
   └─────────────┘                     │         │                     │
                                       │         └──────────┬──────────┘
                                       │                    │
                                       │              ┌─────▼─────┐
                                       │              │Component  │
                                       │              │Selection  │
                                       │              └─────┬─────┘
                                       │                    │
                                       │              ┌─────▼─────┐
                                       └─────────────►│Installation│
                                                      └───────────┘
```

## Component Installation Flow

```
┌──────────────┐
│ User Launches│
│  Installer   │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│                    Welcome Page                               │
│  • Display XRComm logo                                        │
│  • Show version and features                                  │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│                  System Check Page                            │
│  ┌────────────────────────────────────────────────────┐      │
│  │ DependencyChecker.check_all()                      │      │
│  │  ├─ check_python()      → Python 3.8+ found ✓     │      │
│  │  ├─ check_labview()     → LabVIEW 2023 found ✓    │      │
│  │  ├─ check_existing()    → No conflicts ✓          │      │
│  │  ├─ check_disk_space()  → 1024 MB available ✓    │      │
│  │  └─ check_admin()       → Running as admin ✓      │      │
│  └────────────────────────────────────────────────────┘      │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│              Component Selection Page                         │
│  ┌─────────────────────────────────────────────────┐         │
│  │ ☑ FlexWave-UI (50 MB)              [Required]  │         │
│  │ ☑ FlexWave-VISA (100 MB)           [Default]   │         │
│  │ ☐ FlexWave-Server (80 MB)          [Optional]  │         │
│  │ ☐ FlexWave-SDR (200 MB)            [Optional]  │         │
│  │   ├─ ☑ S8010 Driver (50 MB)                    │         │
│  │   ├─ ☑ Firmware Tool (20 MB)                   │         │
│  │   ├─ ☑ Python Libs (30 MB)                     │         │
│  │   └─ ☐ LabVIEW Libs (100 MB) [Requires LabVIEW]│         │
│  │ ☐ FlexWave-Compute (150 MB)        [Optional]  │         │
│  └─────────────────────────────────────────────────┘         │
│  Total: 150 MB                                                │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│                  Update Check Page                            │
│  ┌────────────────────────────────────────────────────┐      │
│  │ UpdateChecker("https://updates.xrcomm.com")        │      │
│  │  ├─ flexwave-ui     → v1.0.0 (latest) ✓          │      │
│  │  └─ flexwave-visa   → v1.0.1 available ⚠         │      │
│  └────────────────────────────────────────────────────┘      │
│  [Skip Update Check]                                          │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│              Installation Path Page                           │
│  Install to: C:\Program Files\XRComm    [Browse...]          │
│                                                                │
│  Space required: 150 MB                                       │
│  Space available: 1024 MB ✓                                   │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│                   Installation Page                           │
│  ┌────────────────────────────────────────────────────┐      │
│  │ Installing FlexWave-UI...              [████──] 60%│      │
│  │                                                     │      │
│  │ Log:                                                │      │
│  │  ✓ Created directory structure                     │      │
│  │  ✓ Copied application files                        │      │
│  │  ✓ Created shortcuts                               │      │
│  │  → Installing FlexWave-VISA...                     │      │
│  └────────────────────────────────────────────────────┘      │
└──────┬───────────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────────┐
│                   Completion Page                             │
│  ✓ Installation Complete!                                     │
│                                                                │
│  ☑ Launch FlexWave-VISA now                                  │
│  ☑ Create desktop shortcuts                                  │
│                                                                │
│  Visit: https://www.xrcomm.com/flexwave                      │
└────────────────────────────────────────────────────────────────┘
```

## File System Layout

```
C:\Program Files\XRComm\
│
├── FlexWave_UI\
│   ├── FlexWave-UI.exe
│   ├── main.py
│   ├── assets\
│   │   └── logo (0).png
│   └── version.txt (1.0.0)
│
├── FlexWave_VISA\
│   ├── FlexWave-VISA.exe
│   ├── bridge\
│   │   ├── bridge_server.py
│   │   └── grpc_visa_wrapper.py
│   ├── proto\
│   │   ├── rfcontrol_pb2.py
│   │   └── rfcontrol_pb2_grpc.py
│   ├── config\
│   │   └── config.yml
│   └── version.txt (1.0.0)
│
├── FlexWave_SDR\
│   ├── drivers\
│   │   └── S8010\
│   │       ├── driver.sys
│   │       └── install_driver.bat
│   ├── tools\
│   │   └── firmware_loader.exe
│   ├── python\
│   │   └── flexwave_sdr\
│   │       ├── __init__.py
│   │       ├── s8010\
│   │       └── client.py
│   └── version.txt (1.0.0)
│
├── FlexWave_Server\
│   ├── server.exe
│   └── version.txt (1.0.0)
│
├── FlexWave_Compute\
│   ├── compute.exe
│   └── version.txt (1.0.0)
│
├── uninst.exe
└── README.txt

C:\Program Files\National Instruments\LabVIEW 2023\instr.lib\
└── FlexSDR S8010\
    ├── FlexSDR S8010.lvlib
    ├── Initialize.vi
    ├── Configure.vi
    ├── Read Data.vi
    └── Close.vi

C:\Users\{User}\AppData\Local\FlexWave_VISA\
├── config.yml (user settings)
└── bridge_launcher.log

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\XRComm\FlexWave\
├── FlexWave UI.lnk
├── FlexWave-VISA.lnk
└── Firmware Loader.lnk

C:\Users\{User}\Desktop\
├── FlexWave UI.lnk
└── FlexWave-VISA.lnk
```

## Update System Architecture

```
┌────────────────┐
│ Installer GUI  │
└────────┬───────┘
         │
         ▼
┌─────────────────────────────────────────┐
│      UpdateChecker                      │
│  __init__(update_server_url, version)  │
└────────┬────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────┐
│  check_for_updates(component)           │
│   ├─ Build request URL                  │
│   ├─ Add headers (User-Agent, Version)  │
│   ├─ Send GET request                   │
│   └─ Parse response                     │
└────────┬────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────┐
│  Update Server API                          │
│  https://updates.xrcomm.com                 │
│                                             │
│  GET /api/updates/{component}/latest        │
│  ┌──────────────────────────────────────┐  │
│  │ Response:                            │  │
│  │ {                                    │  │
│  │   "version": "1.2.3",                │  │
│  │   "download_url": "https://...",    │  │
│  │   "size": 104857600,                 │  │
│  │   "checksum": "sha256:...",          │  │
│  │   "release_date": "2025-01-15"       │  │
│  │ }                                    │  │
│  └──────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────┐
│  Version Comparison                     │
│  using packaging.version.parse()        │
│                                         │
│  if remote_version > local_version:    │
│     return True, update_info           │
│  else:                                  │
│     return False, None                 │
└─────────────────────────────────────────┘
```

## Dependency Checker Flow

```
┌──────────────────────────┐
│  DependencyChecker()     │
└────────┬─────────────────┘
         │
         ├─► check_python()
         │   ├─ Scan Registry
         │   │  ├─ HKCU\Software\Python\PythonCore
         │   │  ├─ HKLM\Software\Python\PythonCore
         │   │  └─ HKLM\Software\Wow6432Node\Python\PythonCore
         │   ├─ Check PATH
         │   └─ Return: {found, versions[], paths[]}
         │
         ├─► check_labview()
         │   ├─ Scan Registry
         │   │  ├─ HKLM\Software\National Instruments\LabVIEW
         │   │  └─ HKLM\Software\Wow6432Node\National Instruments\LabVIEW
         │   ├─ Find all versions
         │   └─ Return: {found, versions[], paths[], latest_version}
         │
         ├─► check_existing_installations()
         │   ├─ Scan Program Files
         │   │  └─ C:\Program Files\XRComm\FlexWave_*
         │   ├─ Read version.txt files
         │   ├─ Check Uninstall Registry
         │   │  └─ HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall
         │   └─ Return: {component: {version, path, size}}
         │
         ├─► check_disk_space(required_mb=500)
         │   ├─ Get free space on C:\
         │   ├─ Compare with required
         │   └─ Return: {available_mb, required_mb, sufficient}
         │
         └─► check_admin_rights()
             ├─ Call ctypes.windll.shell32.IsUserAnAdmin()
             └─ Return: True/False
```

## Build Process Flow

```
┌──────────────────────┐
│ build_installer.ps1  │
│        or            │
│ build_installer.py   │
└──────────┬───────────┘
           │
           ├─► Check Requirements
           │   ├─ python --version
           │   ├─ pyinstaller --version
           │   └─ makensis /VERSION (optional)
           │
           ├─► Install Dependencies
           │   └─ pip install -r requirements.txt
           │
           ├─► Clean (if -Clean flag)
           │   ├─ Remove dist/
           │   ├─ Remove build/
           │   └─ Remove output/
           │
           ├─► PyInstaller Build
           │   ├─ Read FlexWave-Installer.spec
           │   ├─ Analyze dependencies
           │   ├─ Bundle files
           │   ├─ Create executable
           │   └─ Output: dist/FlexWave-Installer.exe
           │
           ├─► NSIS Build (if not -SkipNSIS)
           │   ├─ Read FlexWave-Installer.nsi
           │   ├─ Compile installer
           │   └─ Output: FlexWave-Installer-1.0.0.exe
           │
           └─► Create Standalone Package
               ├─ Copy dist/FlexWave-Installer.exe
               ├─ Copy assets/
               ├─ Copy README.md
               ├─ Create INSTALLER_INFO.txt
               ├─ Package to output/FlexWave-Standalone/
               └─ ZIP to output/FlexWave-Installer-Standalone.zip
```

## Data Flow Diagram

```
┌─────────────┐
│    User     │
└──────┬──────┘
       │ Runs installer
       ▼
┌──────────────────┐
│ Installer GUI    │◄──────┐
│ (QWizard)        │       │
└──────┬───────────┘       │
       │                   │
       ├─► DependencyChecker    ┌──────────────┐
       │   └─► System Info  ────►│   Display    │
       │                         └──────────────┘
       │
       ├─► UpdateChecker    ┌──────────────────┐
       │   ├─► HTTP Request ──►│ Update Server  │
       │   └─► Version Info ───►│   Response    │
       │                        └────────────────┘
       │
       ├─► Component Config ┌──────────────┐
       │   └─► User Selection►│ Selected     │
       │                      │ Components   │
       │                      └──────┬───────┘
       │                             │
       ▼                             ▼
┌──────────────────────────────────────┐
│     Installation Manager             │
├──────────────────────────────────────┤
│  for each component:                 │
│    ├─ Create directories             │
│    ├─ Copy files                     │
│    ├─ Create shortcuts               │
│    ├─ Update registry                │
│    └─ Write version.txt              │
└──────────────────────────────────────┘
       │
       ▼
┌──────────────────┐
│ Installed System │
└──────────────────┘
```

## Registry Structure

```
Windows Registry
│
├─ HKEY_LOCAL_MACHINE
│  ├─ Software
│  │  ├─ Microsoft
│  │  │  └─ Windows
│  │  │     └─ CurrentVersion
│  │  │        ├─ Uninstall
│  │  │        │  └─ FlexWave
│  │  │        │     ├─ DisplayName = "FlexWave"
│  │  │        │     ├─ DisplayVersion = "1.0.0"
│  │  │        │     ├─ Publisher = "XRComm"
│  │  │        │     ├─ InstallLocation = "C:\Program Files\XRComm"
│  │  │        │     ├─ UninstallString = "...\uninst.exe"
│  │  │        │     └─ DisplayIcon = "...\FlexWave-Installer.exe"
│  │  │        │
│  │  │        └─ App Paths
│  │  │           └─ FlexWave-Installer.exe
│  │  │              └─ (Default) = "C:\Program Files\XRComm\..."
│  │  │
│  │  └─ XRComm
│  │     └─ FlexWave
│  │        ├─ Version = "1.0.0"
│  │        ├─ InstallPath = "C:\Program Files\XRComm"
│  │        └─ Components
│  │           ├─ FlexWave-UI = "1.0.0"
│  │           ├─ FlexWave-VISA = "1.0.0"
│  │           └─ FlexWave-SDR = "1.0.0"
│  │
│  └─ Software\National Instruments\LabVIEW
│     └─ {version}
│        └─ PATH = "C:\Program Files\National Instruments\LabVIEW {version}"
```

## Network Communication

```
┌──────────────────┐
│ Installer Client │
└────────┬─────────┘
         │
         │ HTTPS (Port 443)
         │
         ▼
┌─────────────────────────────────────┐
│   Update Server                     │
│   updates.xrcomm.com                │
├─────────────────────────────────────┤
│                                     │
│  Endpoints:                         │
│  ┌──────────────────────────────┐  │
│  │ GET /api/updates/            │  │
│  │     {component}/latest       │  │
│  ├──────────────────────────────┤  │
│  │ GET /api/components          │  │
│  ├──────────────────────────────┤  │
│  │ POST /api/compatibility/check│  │
│  └──────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│   CDN / File Server                 │
│   cdn.xrcomm.com                    │
├─────────────────────────────────────┤
│                                     │
│  /flexwave-visa-1.0.0.exe           │
│  /flexwave-sdr-1.2.0.exe            │
│  /flexwave-ui-1.0.0.exe             │
│                                     │
└─────────────────────────────────────┘
```

---

*This architecture document provides a visual representation of the FlexWave Installer system components, data flow, and interactions.*