# 05 Verification Plan: 20261121-1 Fuente de laboratorio

Gate: G0 (equipment list) and G3 (complete plan) | Version: draft

<!-- Goal: anyone can repeat the verification from this document alone.
     Results are recorded in docs/06, never here. -->

## Equipment

<!-- Start at G0. Accuracy / resolution as stated by the manufacturer for the range used. -->

| Instrument | Model | ID / serial | Calibration status / date | Accuracy / resolution (range used) | Used in |
|---|---|---|---|---|---|

## Test environment

| Item | Value |
|---|---|
| Ambient conditions | TBD |
| Supply source | TBD |
| Safety precautions | TBD (current limit, isolation, energy discharge) |
| Board under test identification | hw tag + serial number |

## Bring-up procedure

<!-- Staged: inspection, passive checks, current-limited first power-up, then stage by stage in the order defined in docs/02 (Extended) or below (Core).
     Do not energize a stage before the previous one passed. -->

| ID | Stage | Action | Expected (numeric limit) | Stop condition |
|---|---|---|---|---|
| BU-01 | Incoming inspection | Visual inspection; measure rail-to-ground resistance before power | TBD | Any short: do not power |
| BU-02 | First power-up | Apply supply with current limit at TBD | TBD | Current above limit |

## Test procedures

<!-- One block per TST. Copy the block below. Every Must REQ verified by Test is covered by at least one TST. -->

### TST-01: TBD

| Field | Content |
|---|---|
| Covers | REQ-nnn |
| Equipment | instrument IDs from the table above |
| Setup | Connections, probe / cable type, grounding, instrument settings (range, bandwidth, averaging), board state, firmware version |
| Steps | 1. ... 2. ... |
| Measurement points | test point names (as on the schematic) |
| Pass / fail limit | numeric, with unit, from REQ-nnn |
| Repeats | number of runs, and the criterion for combining them |
| Data file | `test/data/TST-01_runNN_YYYYMMDD.csv` |
| Safety note | TBD |
