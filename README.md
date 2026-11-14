# CAD Models

A personal collection of editable 3D models created with FreeCAD and OpenSCAD. The collection currently contains **80 models in 66 project folders**: 77 FreeCAD documents and 3 OpenSCAD source files.

## Folder structure

Models are filed first by year, then by design or variant family:

```text
CAD-Models/
├── README.md
├── 2021/
│   └── bettregal/
│       ├── bettregal_beifahrerseite.FCStd
│       ├── bettregal_3d_druck.FCStd
│       └── ...
├── 2022/
├── 2023/
├── 2024/
├── 2025/
└── 2026/
```

Each project folder holds one design or a closely related set of variants. Project folders use descriptive, lowercase names with hyphens. Original model filenames remain unchanged so that the migration did not introduce unnecessary renames.

The year-based catalogue avoids subjective topic categories such as `household` or `workshop`, where many designs could fit more than one folder.

### Dates and versions

- During the initial migration, a date in the filename determined the year. For undated files, the filesystem's last-modified date was used.
- Related variants share a project folder instead of being split between years.
- All four `bettregal` models use `2021/` because the family's latest modification date is 2021-05-26, although one file was last modified in 2020.
- Later edits should not move an existing project to another year. Place new projects in the year they are started.

### Supporting files

Create these subfolders only when a project needs them:

- `exports/` for derived files such as STL, 3MF, and STEP.
- `references/` for photographs, measurements, and source material.
- A project-level `README.md` for notes that are too specific for this overview.

FreeCAD backup files belong in the backup location configured in FreeCAD, not in `exports/`.

## Year summaries

- **2021 — 39 models, 30 projects.** The largest year in the collection includes the `bettregal` family, household and bathroom holders, lamp and honeycomb designs, stencils, and an Ivar 3D-printer enclosure. The two OpenSCAD models explore hexagonal patterns and a patterned lampshade.
- **2022 — 8 models, 6 projects.** Practical parts dominate: three `brettchenhalter` variants, a phone holder, a lid, a fuse-box latch, a Logitech joystick model, and Raspberry Pi wall clamps.
- **2023 — 2 models, 2 projects.** Experimental work focused on lamp tests and test pieces for examining thickness and translucency.
- **2024 — 5 models, 5 projects.** Work included two Makita-router baseplates (`DRT50` and `DRT150`), a pleated-blind frame mount, a cable box, and `testdesign`.
- **2025 — 13 models, 13 projects.** Workshop and tooling designs included a drill box, tool-case inserts, drill holders, and sharpening-related models. Other projects included lighting holders, an earring holder, a shower-curtain hook, and an electrical-outlet holder.
- **2026 — 13 models, 10 projects.** Work includes cabinet and drawer adaptations, four `rohrabdeckungen` variants, cable-duct and kitchen-ventilation fittings, lighting holders, and bolt covers. Simulation-related designs include `cfd-experiment` and the OpenSCAD `wigleyhull` model.

## Migration notes

The models were copied from their original locations in the home directory, Documents, Downloads, and Nextcloud. **The original files were left untouched.** Original filenames and modification timestamps were preserved, and source and destination checksums were verified after copying.

The six example documents bundled with the CfdOF FreeCAD add-on were excluded because they are third-party demo files, not models created for this collection.
