---
name: query-optimize
description: Analyze navigation logs and suggest routing improvements for the Second Brain CLAUDE.md decision tree.
disable-model-invocation: true
---

# Query Optimize

Analyze Claude's navigation patterns through the Second Brain and recommend routing improvements.

## Instructions

### 1. Gather Logs

Read all files in `Claude/Navigation Logs/` from the past 30 days. Each file is a pipe-delimited CSV with format: `time|tool|path`

If no logs exist, inform the user that navigation logging needs to run for a while before optimization is possible, and exit.

### 2. Analyze Patterns

From the collected data, identify:

**Most Accessed Files (Top 10)**
- Count accesses per file path
- Flag files accessed >20 times — these are candidates for CLAUDE.md direct routes

**Multi-Hop Navigations**
- Look for sequential reads within a 2-minute window
- Pattern: Read INDEX → Read target (normal, 2 hops)
- Pattern: Read INDEX → Read wrong file → Read correct file (3+ hops = navigation miss)

**Dead-End Files**
- Files read but immediately followed by a different file in a different area

**Unused INDEX Files**
- INDEX files that appear rarely or never in the logs

**Tool Choice Patterns**
- Ratio of Glob vs Read vs Grep usage
- Over-reliance on Grep (should be using direct Read via routing table)
- Glob patterns that always return the same file (should be a direct route)

### 3. Compare Against CLAUDE.md

Read the current `CLAUDE.md` routing table. For each top-accessed file:
- Is there a direct route in the decision tree?
- Is the route accurate?

### 4. Output Recommendations

```
## Navigation Optimization Report — [Date]

### Access Summary
- Total file accesses (30 days): [N]
- Unique files accessed: [N]

### Top 10 Most Accessed Files
1. [path] — [N] accesses [IN ROUTING TABLE / NOT IN TABLE]

### Recommended New Routes
| Query Pattern | Suggested Route | Reason |
|--------------|----------------|--------|
| [pattern] | [direct path] | Accessed [N] times, currently requires [X] hops |

### Navigation Misses
- [area]: [N] misses out of [M] navigations

### INDEX Health
- [INDEX path]: [N] accesses (healthy / underused / never accessed)
```

### 5. Get Approval and Update

Present recommendations to the user. After approval, update `CLAUDE.md` decision tree.

### 6. Archive Old Logs

Move log files older than 60 days to `Claude/Navigation Logs/Archive/YYYY-MM/`

### 7. Update Last Run

Update `Claude/last-run.json` — set the `"query-optimize"` key to today's date (YYYY-MM-DD format).
