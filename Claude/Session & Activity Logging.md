# Session & Activity Logging

*Outcome-based logging system with multi-layer redundancy*

---

## Core Philosophy

**Why This Matters:** Multi-layer redundancy prevents data loss and provides multiple access points to past work.

**Key Principle:** Claude maintains the system proactively. Logging is authorized without asking.

---

## Session Logging (AUTHORIZED AUTOMATIC)

**Outcome**: Substantial sessions captured in daily notes with key work, decisions, and file changes.

**What triggers logging**:
- Project development work
- Strategic decisions or planning
- File creation or significant edits
- Learning breakthroughs
- Task management updates

**What doesn't need logging**:
- Quick factual questions
- Casual conversation
- Simple lookups with no decisions made

**Constraints**:
- Never overwrite existing content (existing file → use edit)
- 2-5 bullets maximum per session
- Link to relevant project files
- Include: what was worked on, decisions made, files changed

**Location**: `Claude/Daily Notes/YYYY-MM-DD.md`

**Format**:
```
# YYYY-MM-DD

## [Brief Topic/Project Name]

- Key point 1
- Key point 2
- Files created/modified: [[link]]
```

### Task-Related Session Logging

When logging project work sessions, link TO the project's TASKS.md file:

```markdown
### Session Log
- Worked on [project] [task]
  - Completed: [what]
  - Updated: [[path/to/TASKS]]
```

**Important:** The TASKS.md file is the single source of truth. Daily notes link TO it, not the other way around.

---

## Multi-Layer Structure

### Daily Notes (Primary Capture)
**Location**: `Claude/Daily Notes/YYYY-MM-DD.md`

No curation needed. Capture happens automatically.

### Weekly Logs (Curated Summaries)
**Location**: `Claude/Weekly Logs/Week of YYYY-MM-DD.md`

**Schedule**: Every Sunday

**Constraints**:
- 3-5 highlights maximum
- Include links to relevant project files
- Note patterns observed across the week

**Inputs**: Daily notes from past week

### Monthly Archives (Append-Only Backup)
**Location**: `Claude/Monthly Archives/YYYY-MM Activity Archive.md`

**Constraints**:
- NEVER edit existing archives, only append new months
- Monthly rollup of weekly logs

---

## Failure Patterns Log

*Track issues with outcome-based logging here. Add constraints as needed.*

| Date | What Happened | Constraint Added |
|------|---------------|------------------|
| — | — | — |

---

*Return to [[Second Brain Guide]] for main system overview*
