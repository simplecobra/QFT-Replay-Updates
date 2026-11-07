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

## Working with the owner

- The owner writes in Roman Urdu (Urdu in Latin script); reply in Roman Urdu unless they write in English.
- Do the work end to end without being asked step by step; ask only before irreversible or public actions (publishing a release, changing a manifest, pushing to `main`).
- **When the owner shares an idea:** don't just carry it out. First research it, then analyze it from every angle (users, competitors, technical feasibility, cost/effort, risks, SEO/marketing impact). Then tell the owner plainly whether there is a better approach than their idea and suggest it, lay out the pros and cons of each option, and discuss it with them so they have the complete picture before deciding. The owner always wants the best possible result, not just what was literally asked.

## Owner's standing goals

These apply to every task, not only when the owner mentions them.

- **EAs and indicators must beat the competition.** Before designing or changing an EA or indicator, research the top ~10 competing products (features, settings, UI, pricing, reviews and complaints), then build something better than all of them. Briefly report what the competitors do and where ours is better.
- **Website goal: Google top 5.** The owner is working to rank the website in the top 5 Google results. Any page, product or post that is added or updated on the website gets SEO done automatically, without being asked: keyword research, title and meta description, headings, URL slug, image alt text, internal links, structured data (schema.org), page speed and mobile checks, and sitemap updates.
- **Google Search Console:** after website changes, do the Search Console steps too (submit/refresh the sitemap, request indexing for new or changed URLs, check for coverage errors). This needs Search Console access in the session; if it isn't available, say exactly which steps remain for the owner instead of skipping them silently.

## Suggestions tracker (`SUGGESTIONS.md`)

The owner often gets 5–7 suggestions in a chat, finishes a few, and forgets the rest by the next day. `SUGGESTIONS.md` is the memory for this. Keep it up to date in every session:

- **At the start of every session**, read `SUGGESTIONS.md` and, before anything else, show the owner the pending items. Ask whether to continue with them, start something new, or do some now and leave others for later.
- **Whenever you give the owner suggestions or next steps**, add each one under **Pending** with the date and a one-line description of what it involves (enough that a future session understands it without this chat).
- **When an item is finished**, move it to **Done / Skipped** marked `done` with the date. **When the owner says to skip/drop it**, move it there marked `skipped` with the date. Never bring done or skipped items up again.
- Keep pending items in order of priority and group them by area (EA/indicator, website/SEO, simulator releases, other).
- Commit and push tracker updates with the session's other work, and remind the owner to merge them so the next session sees the current list.
- - The owner allows Claude to update `SUGGESTIONS.md` on `main` directly by running `bash scripts/push-suggestions.sh` after every change to the list. No other change may go to `main` this way.
