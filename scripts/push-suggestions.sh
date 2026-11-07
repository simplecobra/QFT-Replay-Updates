#!/bin/bash
# Pushes only SUGGESTIONS.md to main, so the tracker is current in every new session.
set -e
git fetch -q origin main
tmp=$(mktemp -d)
git worktree add -q --detach "$tmp" origin/main
cp SUGGESTIONS.md "$tmp/SUGGESTIONS.md"
(
  cd "$tmp"
  git add SUGGESTIONS.md
  if git commit -qm "Update suggestions tracker"; then
    git push -q origin HEAD:main
  fi
)
git worktree remove --force "$tmp"
