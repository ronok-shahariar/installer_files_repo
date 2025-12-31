# installer_files_repo
﻿**PERFECT!** Thank you for showing the real repo — this is **exactly** how it should look in real life.

Here is your **FINAL, OFFICIAL, 100% locked-in architecture** for **FlexWave-TruSystems Software Center**, based on your actual folder structure.

We now support **mixed content** perfectly: EXE installers, LabVIEW VIs, documentation, multiple sub-modules — all under one product.

### Final Real-World Folder Structure (This is THE STANDARD)

```
modules/
└── SAT100T/                          ← One product = one folder
    ├── SAT100T.png                   ← Product icon
    ├── display_name.txt              ← e.g. "SAT100T Multi-Function Controller"
    │
    ├── docs/                         ← Global product documentation (always shown)
    │     ├── user_guide.md
    │     └── guide_1.png
    │
    ├── FlexWave-VISA/                ← Sub-module: EXE installer
    │   ├── v1.0.0/
    │   │     LabVIEW_Bridge_Server_Installer_v1.0.0.exe
    │   │     release_notes.md
    │   └── v1.1.0/
    │         Flexwave_VISA_Installer_v1.1.0.exe
    │         release_notes.md
    │
    ├── UI/                           ← Sub-module: LabVIEW VI (lib type)
    │   ├── v1.0.0/
    │   │     gRPC_Wrapper_VISA_implement_v1.0.0.vi
    │   │     release_notes.md
    │   └── v1.1.0/
    │         gRPC_Wrapper_VISA_implement_v1.1.0.vi
    │         release_notes.md
    │
    └── FlexWave-Compute/             ← Future sub-module (can be .zip, .exe, etc.)
```

This is **beautiful, scalable, and 100% client-friendly**.

### Official Rules (Give This to Clients)

```markdown
# How to Add a Product to FlexWave-TruSystems Software Center

1. Create a folder inside `modules/` → e.g. `SAT8870S`
2. Inside it, add:
   - `SAT8870S.png` → your product icon
   - `display_name.txt` → full product name (optional)
   - `docs/` → user guides, diagrams (optional)

3. Create sub-folders for each component:
   - `UI/` → LabVIEW VIs, DLLs, config files
   - `FlexWave-VISA/` → Windows installers (.exe)
   - `Drivers/` → driver packages
   - `Firmware/` → .bin files

4. Inside each sub-folder, create version folders:
   - Must be named: `v1.0.0`, `v2.1.3`, etc.
   - Put your file(s) + `release_notes.md`

5. Push to GitHub → DONE!

The app automatically detects:
- .exe → Full installer (Run → Track → Uninstall)
- .vi, .dll, .zip → Copy to local folder
- docs/ → Show in sliding panel
```

### How the App Will Display It

```
FlexWave-TruSystems Software Center
└── SAT100T Multi-Function Controller
    ├── FlexWave-VISA
    │   ├── v1.1.0     [Latest] [Install]
    │   └── v1.0.0
    ├── UI
    │   ├── v1.1.0     [Latest] [Install]
    │   └── v1.0.0
    └── Documentation → (slides in when > clicked)
          • User Guide
          • Wiring Diagram
          • Setup Video
```

### Final App Architecture (Locked In)

| Path                              | Purpose |
|-----------------------------------|-------|
| `modules/SAT100T/`                | One product |
| `modules/SAT100T/FlexWave-VISA/v1.1.0/` | EXE installer → download + run + registry detect |
| `modules/SAT100T/UI/v1.1.0/`       | LabVIEW VI → copy to `C:\TruSystems\SAT100T\UI\` |
| `modules/SAT100T/docs/`           | Always visible in sliding panel |
| `manifest.json` (optional)        | Only for custom names / order |

### Final `manifest.json` (Recommended Default)

```json
{
  "app_name": "FlexWave-TruSystems Software Center",
  "auto_discover": true,
  "repository": "https://github.com/yourorg/FlexWave_TruSystems_Git_Repo",
  "custom_names": {
    "SAT100T": "SAT100T Multi-Function Controller",
    "SAT8870S": "SAT8870S Advanced Signal Analyzer"
  }
}
```




