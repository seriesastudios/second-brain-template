#!/bin/bash
# Session start hook: check last-run dates and suggest overdue tasks
# Cross-platform: works on macOS and Linux, with or without git/jq

SECOND_BRAIN=$(git rev-parse --show-toplevel 2>/dev/null || dirname "$(dirname "$(dirname "$0")")")
LAST_RUN="$SECOND_BRAIN/Claude/last-run.json"
TODAY=$(date +%Y-%m-%d)
DOW=$(date +%u)  # 1=Mon, 7=Sun
DOM=$(date +%d)  # Day of month
SUGGESTIONS=""

# Read last-run dates (graceful if jq unavailable)
if [ -f "$LAST_RUN" ] && command -v jq &>/dev/null; then
  LAST_WEEKLY=$(jq -r '.["weekly-check"] // empty' "$LAST_RUN")
  LAST_MONTHLY=$(jq -r '.["monthly-check"] // empty' "$LAST_RUN")
  LAST_PROJECT=$(jq -r '.["project-review"] // empty' "$LAST_RUN")
fi

# Sunday + no weekly check today
if [ "$DOW" -eq 7 ] && [ "$LAST_WEEKLY" != "$TODAY" ]; then
  SUGGESTIONS="$SUGGESTIONS Today is Sunday - offer to run /weekly-check."
fi

# First week of month + no monthly check this month
CURRENT_MONTH=$(date +%Y-%m)
if [ "$DOM" -le 7 ] && [[ "$LAST_MONTHLY" != "$CURRENT_MONTH"* ]]; then
  SUGGESTIONS="$SUGGESTIONS First week of the month - offer /monthly-check if not done."
fi

# Project review >10 days ago
if [ -n "$LAST_PROJECT" ]; then
  # Cross-platform date arithmetic
  if date -j -f %Y-%m-%d "$TODAY" +%s &>/dev/null 2>&1; then
    # macOS
    DAYS_SINCE=$(( ($(date -j -f %Y-%m-%d "$TODAY" +%s) - $(date -j -f %Y-%m-%d "$LAST_PROJECT" +%s)) / 86400 ))
  elif python3 -c "pass" &>/dev/null 2>&1; then
    # Fallback: python3
    DAYS_SINCE=$(python3 -c "from datetime import date; print((date.fromisoformat('$TODAY') - date.fromisoformat('$LAST_PROJECT')).days)" 2>/dev/null)
  elif date -d "$TODAY" +%s &>/dev/null 2>&1; then
    # GNU date (Linux)
    DAYS_SINCE=$(( ($(date -d "$TODAY" +%s) - $(date -d "$LAST_PROJECT" +%s)) / 86400 ))
  fi

  if [ -n "$DAYS_SINCE" ] && [ "$DAYS_SINCE" -gt 10 ] 2>/dev/null; then
    SUGGESTIONS="$SUGGESTIONS Last project review was ${DAYS_SINCE} days ago."
  fi
fi

if [ -n "$SUGGESTIONS" ]; then
  echo "{\"additionalContext\": \"$SUGGESTIONS\"}"
fi
exit 0
