# Installer Documentations


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