SECOND BRAIN QUICK CHECK

Run a combined health and navigation check on the Second Brain (current working directory).

## HEALTH

Check these files and report their "Last updated" or "Last Updated" dates:
- Task Management/INDEX.md
- Claude/Daily Notes/ (most recent file)
- Claude/Weekly Logs/ (most recent file)

Flag any that are >14 days stale.

## NAVIGATION

Run these 2 queries and report tool calls used:

**Query A:** Pick a project from Task Management/INDEX.md and check its status.
- Expected: 1-2 tool calls

**Query B:** Pick a project with detailed sub-files and navigate to the latest development notes.
- Expected: 2 tool calls (Project INDEX → dev notes)

## NAVIGATION QUICK GLANCE

Read the last 7 days of `Claude/Navigation Logs/` (if any exist). Report:
- Total file accesses this week
- Top 5 most-accessed files
- Any file accessed >10 times (candidate for CLAUDE.md shortcut)
- Any session with >5 sequential reads in the same area (possible navigation inefficiency)

Keep this to 3-5 lines. Only flag if something is notable. Skip this section entirely if no navigation logs exist yet.

## REPORT

Generate this summary:

```
QUICK CHECK - [TODAY'S DATE]

HEALTH:
- Task Management INDEX: [date] [OK / STALE]
- Latest Weekly Log: [filename] [OK / STALE]
- Latest Daily Note: [filename] [OK / STALE]

NAVIGATION:
- Query A (status): [X] tool calls (expected: 1-2) [OK / HIGH]
- Query B (detail): [X] tool calls (expected: 2) [OK / HIGH]

NAV LOGS: [summary or "No logs yet"]

STATUS: [HEALTHY / NEEDS ATTENTION]

[If NEEDS ATTENTION, list specific issues]
```

## UPDATE LAST RUN

**After completing this check**, update `Claude/last-run.json` — set the `"weekly-check"` key to today's date (YYYY-MM-DD format).
