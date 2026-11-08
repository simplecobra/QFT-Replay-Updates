# Suggestions tracker

Every suggestion Claude gives the owner is recorded here so nothing gets forgotten between chats. See "Suggestions tracker" in `CLAUDE.md` for how it is kept.

## Pending

### Simulator releases
- 2026-11-08 — Publish v3.05 (MT5 + MT4): owner compiles, runs QFT_UpdateBuilder / QFT_UpdateBuilder_MT4 with the release notes, uploads ex5/ex4 + versioned DLLs + update.txt / update_mt4.txt (steps in RELEASE_STEPS_v3.05.txt of the PRIVATE zip). Claude then checks the raw files and signatures.
- 2026-11-08 — Update the simulator User Guide PDF (still v2.93, 31 pages) to v3.05: Smart Panel, Prop Firm, multi-symbol, MT4.
- 2026-11-08 — Website: update the What's new part of qaziforextips.com/simulator for v3.05 (+ SEO), after the release is live.

### EA/indicator
- 2026-11-08 — Prev Bar faster: reuse the loaded day instead of reading the tick file again on every click.
- 2026-11-08 — Speed: Next Bar takes 8–10 s; test restoring the host chart and optimize.
- 2026-11-08 — v3.06: SMT pair shortcut (e.g. XAUUSD -> DXY, EURUSD -> GBPUSD chosen automatically, broker symbol names checked).
- Later — Volume Profile on replay charts.

### Website/SEO
- 2026-11-08 — SaaSHub profile: logo, demo video, and the badge on qaziforextips.com (listing approved and verified; staying free).

## Done / Skipped

- 2026-11-08 — done — v3.05 final: tested by owner; What's New 3.05 + Features PDFs, PRIVATE zip, release steps.
- 2026-11-08 — done — "Download missing data" (one button for all extra pairs) instead of a button per pair.
- 2026-11-08 — done — Smooth Prev Bar, clear "Allow DLL imports" message, one simulator per terminal, "chosen twice" check.
- 2026-11-08 — done — QFTSimUI.c DLL source rebuilt to v3.05 parity (PRIVATE zip + Project backup).
- 2026-11-08 — done — Per-pair status + tooltips in New Simulation (owner idea).
- 2026-11-08 — done — Block license 78010855 via signed control.txt on main (reason: "You are not eligible to use this software").
- 2026-11-08 — done — SaaSHub listing approved and verified with info@qaziforextips.com.
- 2026-11-08 — skipped — SaaSHub paid featured listing.
- 2026-11-08 — skipped — Publish MT4 v3.04 (replaced by v3.05).
- 2026-11-08 — skipped — Download button under every pair (owner chose one button).
