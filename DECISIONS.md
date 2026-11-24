# Decisions: 20261121-1 Fuente de laboratorio

<!-- Decisions, rejected alternatives and waivers. Never delete an entry: mark it `Superseded by DEC-nnn`.
     Status: Accepted | Superseded | Waiver (a requirement accepted as not met, with risk acceptance). -->

| ID | Date | Status | Title | Related REQ |
|---|---|---|---|---|
| DEC-001 | 2026-11-24 | Accepted | Project level: Extended | n/a |
| DEC-002 | 2026-11-24 | Superseded by DEC-006 | Keep existing folder names, map skill layout | n/a |
| DEC-003 | 2026-11-24 | Accepted | Release tags hw-vX.Y supersede revX | n/a |
| DEC-004 | 2026-11-24 | Accepted | Keep existing .gitignore unchanged | n/a |
| DEC-005 | 2026-11-24 | Accepted | Decision log in DECISIONS.md, not docs/decisions/ | n/a |
| DEC-006 | 2026-11-24 | Accepted | Rename folders to the skill layout | n/a |

---

## DEC-001: Project level: Extended

- **Date:** 2026-11-24
- **Status:** Accepted
- **Context:** Mains input (230 V nominal, 253 V max per docs/PRD.md §4) and several interacting stages: input protection, winding switching, OUT-1 regulation with current limit, auxiliary negative rail, ±12 V, 5 V buck.
- **Decision:** Extended.
- **Alternatives rejected:** Core: does not meet the criteria (mains and multiple interacting stages).
- **Consequences:** Gates used: G0 to G5.

## DEC-002: Keep existing folder names, map skill layout

- **Date:** 2026-11-24
- **Status:** Superseded by DEC-006
- **Context:** Project predates the skill structure (hardware/, simulation/, measurements/, mechanical/, fabrication-outputs/). Renaming would break existing references (READMEs, KiCad plugin configs).
- **Decision:** Keep folders; mapping table in CLAUDE.md. Missing subfolders added (hardware/reports, simulation/results, simulation/models, measurements/data, measurements/captures, mechanical/exports, exports).
- **Alternatives rejected:** Rename to hw/, sim/, test/, mech/, fab/: breaks paths, user asked not to modify existing files.
- **Consequences:** Skill paths in templates must be read through the mapping table.

## DEC-003: Release tags hw-vX.Y supersede revX

- **Date:** 2026-11-24
- **Status:** Accepted
- **Context:** REV_CONVENTION.md and CHANGELOG.md define tags revA, revB and fabrication-outputs/revX/. The skill uses hw-vX.Y.
- **Decision:** Use hw-vX.Y (annotated) per fabricated revision, mech-vX.Y for mechanical releases, vX.Y at G5. Fab outputs in fab/hw-vX.Y/. Commit prefixes per CLAUDE.md rule 9.
- **Alternatives rejected:** Keep revX: user chose the skill convention.
- **Consequences:** REV_CONVENTION.md, CHANGELOG.md, fab/README.md and docs/PRD.md (revision field) are outdated until the user updates them (task in TASKS.md). Silkscreen marking must be vX.Y.

## DEC-004: Keep existing .gitignore unchanged

- **Date:** 2026-11-24
- **Status:** Accepted
- **Context:** .gitignore ignores `*.csv` and `*.xml` globally. hw/.history/ contains a nested .git (KiCad local history).
- **Decision:** User chose not to modify .gitignore. The initial commit excludes hw/.history/ by pathspec (it stays untracked).
- **Alternatives rejected:** Remove `*.csv` / `*.xml` from the global list and ignore `hw/**/.history/`.
- **Consequences:** Raw CSV data (test/data/, sim/ exports) is not versioned, which conflicts with the evidence rule (file path + commit). Until resolved, any result relying on a CSV is Not evidenced. `.history/` appears as untracked in `git status`.

## DEC-005: Decision log in DECISIONS.md, not docs/decisions/

- **Date:** 2026-11-24
- **Status:** Accepted
- **Context:** docs/decisions/ (ADR, one file per decision) exists with an empty index.
- **Decision:** DECISIONS.md with DEC-nnn is the only decision log. PRD open decisions D1 to D3 are recorded here as DEC entries when decided.
- **Alternatives rejected:** ADR files in docs/decisions/.
- **Consequences:** docs/decisions/ is unused.

## DEC-006: Rename folders to the skill layout

- **Date:** 2026-11-24
- **Status:** Accepted
- **Context:** User asked to use the skill folder names instead of mapping (supersedes DEC-002).
- **Decision:** Renamed hardware/ to hw/, simulation/ to sim/, measurements/ to test/, mechanical/ to mech/, fabrication-outputs/ to fab/. Contents moved unchanged.
- **Alternatives rejected:** Keep old names with a mapping table (DEC-002).
- **Consequences:** Existing files still reference the old names: README.md (structure section), REV_CONVENTION.md and the READMEs inside each renamed folder. The .gitignore rules `/hardware/plot/`, `/hardware/gerbers-scratch/` and `/simulation/*.log` were updated to `/hw/...` and `/sim/*.log` (only those three lines changed). KiCad project paths are project-relative and unaffected. On 2026-11-24 the KiCad project was also flattened from hw/20261121_1/ into hw/ (user request).

<!-- Copy this block for each new decision:

## DEC-nnn: Title

- **Date:**
- **Status:**
- **Context:** the problem and the constraints
- **Decision:** what was chosen
- **Alternatives rejected:** each with the reason
- **Consequences:** risks accepted, what must be verified, impact on REQ / SIM / TST
-->
