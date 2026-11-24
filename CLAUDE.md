# 20261121-1 Fuente de laboratorio: project context for Claude

**Level:** Extended | **Next gate:** G0 | **Last gate passed:** none
**Repo root:** `D:\NYQUEN\Proyectos\20261121-1`
**Skill:** `diy-hardware-project` (modes: discuss, status, change, gate-review, release, record)

## Project layout (adopted project, DEC-006)

This project existed before the skill structure was applied. Folders were renamed to the skill layout: `hw/`, `sim/`, `test/`, `mech/`, `fab/`, `exports/`. KiCad project in `hw/`. Fab outputs in `fab/hw-vX.Y/` (one immutable folder per tag). No `fw/` (no firmware in scope).

Other existing content:

| Path | Role |
|---|---|
| `docs/PRD.md`, `docs/Investigacion_fuentes_de_laboratorio.md` | Source inputs (Spanish). Requirements are migrated into `docs/01`; `docs/01` is authoritative once baselined |
| `docs/decisions/` | Not used. Decisions go in `DECISIONS.md` (DEC-005) |
| `REV_CONVENTION.md`, `CHANGELOG.md`, `README.md` (structure section), folder READMEs | Tag scheme `revX` superseded by `hw-vX.Y` (DEC-003); old folder names and `revX` pending update by the user (see TASKS) |
| `3d-renders/`, `scripts/` | Out of the skill workflow |

Known repo caveats (DEC-004): `.gitignore` ignores `*.csv` and `*.xml`, so raw CSV data is not versioned; `hw/.history/` is a nested git repo (KiCad local history) and is not committed. Path rules updated to `/hw/...` and `/sim/*.log` (DEC-006).

Simulator is NI Multisim 13, not LTspice: where the skill says `.asc`, read `.ms13` / `.cir`.

## Read first

1. `TASKS.md` (current state and next step)
2. `docs/01-requirements.md`
3. `TRACEABILITY.md`
4. `DECISIONS.md` (latest entries)

## Toolchain

- KiCad 10.0: hw/ (created from template KDT_Hierarchical; files still in 8.0 format until saved in 10.0). Title blocks use text variables; REVISION must equal the hw tag (vX.Y)
- NI Multisim 13 (.ms13) and SPICE netlists (.cir): sim/
- FreeCAD (version TBD): mech/
- LibreOffice Calc: test/*.ods (export only, not source of truth)
- Git + Git LFS

## Rules (self-contained; they apply even if the skill is not installed)

1. Markdown is the source of truth. LibreOffice files are exports only (`exports/`).
2. IDs are never reused: `REQ-nnn`, `SIM-nn`, `TST-nn`, `BU-nn`, `DEC-nnn`, `T-nnn`.
3. A requirement needs a measurable statement (value, tolerance or limit, conditions), a priority (Must/Should) and a verification method (Sim/Test/Inspection/Analysis).
4. No Pass without evidence: file path + git commit or tag + date + instrument ID. Not evidenced = Fail. An empty field or `TBD` is never evidence.
5. Never invent measurements, specs, part numbers, dates or versions. Ask.
6. Do not design schematics or PCBs, do circuit calculations or write SPICE / firmware code or design mechanical parts as part of the project workflow. If explicitly asked, treat it as a separate task and then update TASKS, TRACEABILITY and DECISIONS.
7. Never delete or overwrite design files (`hw/`, `sim/*.asc`, `fw/`, `mech/`). Edit only docs, tracking files and reports.
8. Changes after a baseline go through impact analysis: mark affected TRACEABILITY rows `Stale`, add a DEC entry, add a CHANGELOG entry under `Unreleased`.
9. Commits are proposed, not automatic. Prefixes: `docs:` `sim:` `hw:` `fw:` `test:` `fab:` `chore:`.
10. Tags: `hw-vX.Y` for every fabricated revision, `mech-vX.Y` for mechanical releases (only if `mech/` exists), `vX.Y` at closure (G5).
11. Update `TASKS.md` at the end of every working session.
12. Do not change the `Next gate` header above without the user's confirmation.
13. Challenge requirements and decisions when there is a real risk. Otherwise do exactly what is asked.
14. A gate certifies evidence, consistency and repeatability. It does not certify design correctness.

## Gate summary

| Gate | Passes when |
|---|---|
| G0 Definition | Measurable requirements approved |
| G1 Architecture and simulation (Extended) | Every block simulated and meets its acceptance criteria |
| G2 Schematic (Extended) | ERC clean, preliminary BOM, traceability updated |
| G3 Layout and release | DRC clean, verification plan complete, tag `hw-vX.Y`, `fab/` generated |
| G4 Bring-up (Extended) | Power and stages brought up in order per plan |
| G5 Closure | Every Must requirement has a Pass with evidence |

Core uses G0, G3, G5: Core G3 = G1 + G2 + G3 checks; Core G5 = G4 + G5 checks.
