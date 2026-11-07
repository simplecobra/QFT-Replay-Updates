# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A distribution channel for **QFT Replay Simulator** updates, not a source tree. It holds only compiled release binaries and the update manifests the installed simulator reads to self-update. There is no source code, build system, linter, or test suite; nothing here can be compiled or run on Linux.

- `QFT_Replay_Simulator_vX.YY.ex5` + `QFTSimUI_vX.YY.dll` — MetaTrader 5 Expert Advisor and its companion UI DLL.
- `QFT_Replay_Simulator_MT4_vX.YY.ex4` + `QFTSimUI_MT4_vX.YY.dll` — MetaTrader 4 build (MT4 releases start at 3.03).
- `update.txt` — manifest for the MT5 channel; `update_mt4.txt` — manifest for the MT4 channel.
- `Test/` — a separate test channel (its own `update.txt` and `_TEST_` EA) used to try the update flow without touching the main channel.

Old versions are kept in the repo rather than deleted; only the manifest decides which version clients install. Files are added via GitHub web uploads ("Add files via upload" commits).

## Manifest format

Each manifest is a small key=value file with **CRLF line endings** (keep them — the client is Windows/MQL):

```
QFT-UPDATE 1
version=3.04
date=2026.10.27
ea=<EA filename in repo root>
ea_sha=<uppercase SHA-256 of the EA file>
dll=<DLL filename in repo root>
dll_sha=<uppercase SHA-256 of the DLL file>
notes=<release notes, items separated by |>
sig=<16 uppercase hex chars>
```

- `ea`/`dll` must name files that exist in the same directory as the manifest, and the `*_sha` values must match them exactly. Verify with:
  ```bash
  sha256sum QFT_Replay_Simulator_v3.04.ex5 QFTSimUI_v3.04.dll | tr a-f A-F
  ```
- `date` uses `YYYY.MM.DD`.
- `sig` is a signature over the manifest content produced by the author's own tooling; it changes whenever any field changes (even just `date` or `notes`). The algorithm and key are not in this repo, so **do not hand-edit any signed field** — a manifest edited here without a regenerated `sig` will be rejected by clients. Changes to manifests should come from the author's signing tool.
- The current `notes` line in `update.txt` appears cut off mid-word, suggesting a length limit on that field; keep notes short.
