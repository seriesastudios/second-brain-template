SECOND BRAIN HEALTH CHECK

Run a comprehensive health check on the Second Brain (current working directory).

For each category, report: PASS / WARNING / FAIL

---

## 1. INDEX FRESHNESS

Check "Last updated" line in:
- INDEX.md (root)
- Task Management/INDEX.md
- All top-level area INDEX.md files (use Glob to find `*/INDEX.md`)

Scoring:
- PASS: All within 14 days
- WARNING: 1-2 files 14-30 days old
- FAIL: Any >30 days OR 3+ files 14-30 days

---

## 2. LOGGING CONTINUITY

List files in Claude/Daily Notes/
Check for gaps >7 days in the last 30 days.

Scoring:
- PASS: No gaps >7 days in last 30 days
- WARNING: 1 gap of 7-14 days
- FAIL: Multiple gaps OR any gap >14 days

---

## 3. WEEKLY LOG CURRENCY

Find most recent file in Claude/Weekly Logs/

Scoring:
- PASS: Within 14 days
- WARNING: 14-21 days old
- FAIL: >21 days old

---

## 4. TASK FILE SIZE

Find all TASKS.md files across the Second Brain (use Glob for `*/TASKS.md` and `*/PROJECT - */TASKS.md`).
Count lines in each.

Scoring:
- PASS: All under 150 lines
- WARNING: Any 150-250 lines
- FAIL: Any over 250 lines

---

## REPORT

Generate this summary:

```
HEALTH CHECK - [TODAY'S DATE]

| Category | Status | Details |
|----------|--------|---------|
| INDEX Freshness | [PASS/WARN/FAIL] | [ages] |
| Logging Continuity | [PASS/WARN/FAIL] | [gaps found] |
| Weekly Log Currency | [PASS/WARN/FAIL] | [most recent] |
| Task File Size | [PASS/WARN/FAIL] | [line counts] |

OVERALL: [X/4 PASSING]

ACTIONS NEEDED:
- [List items needing attention, or "None"]
```

## UPDATE LAST RUN

**After completing this check**, update `Claude/last-run.json` — set the `"monthly-check"` key to today's date (YYYY-MM-DD format).
