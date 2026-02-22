SECOND BRAIN NAVIGATION BENCHMARK

Run 5 navigation queries against the Second Brain (current working directory).

For each benchmark:
1. Answer the query
2. Report: files read, tool calls, navigation method, first file accessed
3. Compare against expected behavior

---

## BENCHMARK 1: Status Query

Query: Pick a project from Task Management/INDEX.md and check its current status.

Expected:
- First file: Task Management/INDEX.md → follow link to project TASKS.md
- Tool calls: 1-2
- Method: direct

---

## BENCHMARK 2: Priority Query

Query: "What should I work on this week?"

Expected:
- First file: Task Management/INDEX.md
- Tool calls: 1
- Method: direct

---

## BENCHMARK 3: Project Detail Query

Query: Pick a project with sub-files and navigate to the latest development notes.

Expected:
- First file: [Area]/PROJECT - [Name]/INDEX.md
- Second file: Most recent development notes (via link)
- Tool calls: 2
- Method: link-following

---

## BENCHMARK 4: Cross-Area Query

Query: Pick two related areas and explain how they connect.

Expected:
- Files: Two different area TASKS.md or INDEX.md files
- Tool calls: 2-3
- Method: cross-area navigation

---

## BENCHMARK 5: Recent Activity Query

Query: "What did I work on last week?"

Expected:
- First file: Claude/Weekly Logs/[most recent].md
- Tool calls: 1
- Method: direct

---

## REPORT

After running all 5, generate this summary:

```
NAVIGATION BENCHMARK - [TODAY'S DATE]

| # | Query Type | Expected | Actual | Method | Result |
|---|------------|----------|--------|--------|--------|
| 1 | Status | 1-2 | [X] | [direct/link/dir/search] | [PASS/FAIL] |
| 2 | Priority | 1 | [X] | [direct/link/dir/search] | [PASS/FAIL] |
| 3 | Project Detail | 2 | [X] | [direct/link/dir/search] | [PASS/FAIL] |
| 4 | Cross-Area | 2-3 | [X] | [direct/link/dir/search] | [PASS/FAIL] |
| 5 | Recent Activity | 1 | [X] | [direct/link/dir/search] | [PASS/FAIL] |

OVERALL: [X/5 PASSING]
AVERAGE TOOL CALLS: [X.X] (baseline: 1.4)

ISSUES:
- [List any directory-listing or search fallback]
- [List any queries exceeding expected tool calls by >1]
- [Or "None"]
```

## UPDATE LAST RUN

**After completing this benchmark**, update `Claude/last-run.json` — set the `"quarterly-check"` key to today's date (YYYY-MM-DD format).
