#!/bin/bash
# Auto-commit Second Brain changes on session end
# Silently exits if git is not available

command -v git &>/dev/null || exit 0

SECOND_BRAIN=$(git rev-parse --show-toplevel 2>/dev/null || exit 0)

cd "$SECOND_BRAIN" || exit 0

# Check if there are changes
if git diff --quiet && git diff --staged --quiet; then
  exit 0  # No changes
fi

# Stage and commit
git add -A
git commit -m "Auto-commit: $(date '+%b %d %Y %H:%M')"
git push origin main 2>/dev/null

exit 0
