# Tasks: 20261121-1 Fuente de laboratorio

Level: Extended | Next gate: G0

<!-- Format: - [ ] T-001 [G0] Short imperative description (REQ/SIM/TST ids if relevant)
     Update at the end of every working session. Never reuse a T-id. -->

## Now

- [ ] T-001 [G0] Define scope, operating conditions and safety section in docs/01
- [ ] T-002 [G0] Write measurable requirements (REQ) with verification method
- [ ] T-003 [G0] List instruments available for each Must test in docs/05 (equipment table)
- [ ] T-004 [G0] Migrate docs/PRD.md §3, §4 and §8 (OUT-1..3, mains assumptions, safety) into docs/01 as REQs; T1..T8 of §10 become candidate TSTs
- [ ] T-005 [G0] Resolve how raw CSV evidence is versioned given `*.csv` in .gitignore (DEC-004)

## Next

- [ ] T-006 [G0] Record PRD open decisions D1, D2, D3 as DEC entries once decided
- [ ] T-007 [G1] Map existing simulations (sim/*.ms13, *.cir) to SIM-nn rows in docs/03 with numeric acceptance criteria
- [ ] T-008 [G1] Fill docs/02 blocks and interfaces from docs/PRD.md §6
- [ ] T-009 Update REV_CONVENTION.md, CHANGELOG.md, fab/README.md and docs/PRD.md revision field to hw-vX.Y (DEC-003)
- [ ] T-011 Update old folder names in README.md, REV_CONVENTION.md and folder READMEs (DEC-006)
- [ ] T-010 Record KiCad and FreeCAD versions in CLAUDE.md toolchain and mech/README.md

## Blocked

## Backlog (next revision)

## Done

- [x] T-012 Rename folders to skill layout and update .gitignore path rules (DEC-006)

## Gate log

| Gate | Date | Commit / tag | Reviewer | Notes |
|---|---|---|---|---|
