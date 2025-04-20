
# DFX Memory System: TCL Script Setup

## 1. Create `build.tcl`
- In Vivado: **File > Project > Write Project Tcl** → Save as `build.tcl`.

## 2. Edit `build.tcl`
Replace:
```tcl
set origin_dir "."
```
With:
```tcl
set origin_dir [file dirname [info script]]
```

Replace:
```tcl
create_project myproject ./myproject
```
With:
```tcl
create_project myproject $origin_dir/myproject
```

## 3. Run Script
- Open Vivado → **Window > Tcl Console**.
- Navigate to project folder:
  ```tcl
  cd /path/to/project/Vivado
  ```
- Run:
  ```tcl
  source build.tcl
  ```
