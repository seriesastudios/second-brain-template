---
name: project-review
description: Review all task lists, identify stale items, and ask status questions. Use weekly to keep projects current.
disable-model-invocation: true
---

# Project Review

Review all task lists across the Second Brain, identify stale items, and interactively update project status.

## Instructions

### 1. Gather All Task Files

Read the following files:

**Task Management Overview:**
- `Task Management/INDEX.md`

**All Project Task Files:**
- Use Glob to find all `*/PROJECT - */TASKS.md` files (scans all top-level work areas)
- Also check `*/TASKS.md` for area-level task files

### 2. Analyze for Staleness

Check each file for:

- **"Last updated" date** — Flag if > 7 days old
- **"This Week" items** — Flag if week has passed
- **"Waiting On" items** — Flag items with no recent progress notes
- **Upcoming deadlines** — Flag anything due within 14 days
- **Empty sections** — Note if a project has no active tasks

### 3. Prepare Questions

Batch questions efficiently. Group by project and present using `AskUserQuestion`:

```
Project: [Name]
- [ ] "[Task]" has been in This Week for 2 weeks. Status?
  - Completed
  - Still in progress
  - Blocked (will ask why)
  - Remove/defer
```

### 4. Update Files

Based on responses:
- Move completed items to "Done" section
- Update status notes for in-progress items
- Add blocker notes for blocked items
- Remove or move deferred items to "Later" section
- Update "Last updated: YYYY-MM-DD" at the top of each modified file

### 5. Sync Task Management INDEX

After updating individual project files:

1. **Check for missing projects:** Compare projects listed in Task Management INDEX against actual `PROJECT -` folders found via Glob.
2. **Check for stale deadlines:** Review deadlines section. Flag any dates that have passed.
3. **Update project descriptions:** If a project's status has changed significantly.
4. **Update "Last updated" date.**

### 6. Generate Summary

```
## Project Review Summary — [Date]

### Projects Reviewed
- [Project Name] — [X items updated, Y items stale]

### Upcoming Deadlines (14 days)
- [Deadline] — [Project] — [Days remaining]

### Items Needing Attention
- [Item] — [Why it needs attention]

### Completed This Session
- [List of items marked complete]
```

### 7. Log to Daily Notes

Add entry to `Claude/Daily Notes/YYYY-MM-DD.md`:

```
## Project Review
- Reviewed [X] project files
- Updated [Y] tasks
- Key deadlines: [list]
- Stale items addressed: [count]
```

### 8. Update Last Run Timestamp

**After completing this skill**, update `Claude/last-run.json` — set the `"project-review"` key to today's date (YYYY-MM-DD format).

## Staleness Detection Rules

| Indicator | Threshold | Action |
|-----------|-----------|--------|
| Last updated date | > 7 days | Flag entire file |
| "This Week" item | > 7 days in section | Ask for status |
| "Waiting On" | > 14 days no update | Ask if still waiting |
| Deadline | < 14 days away | Highlight prominently |
| Deadline | Passed | Ask if completed or missed |

## Question Batching Strategy

To avoid overwhelming the user, batch questions by project:
1. Show project name
2. List 2-4 stale items with multiple-choice options
3. Move to next project
4. At the end, confirm all updates before writing files
