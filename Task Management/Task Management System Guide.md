# Task Management System Guide

*Claude's reference for managing projects and tasks within the Second Brain*

## Core Philosophy

- **User focuses on work, Claude handles system architecture** — no manual file management
- **No rigid hierarchies** that cause analysis paralysis
- **Area-based organization** reflecting natural mental model
- **Claude as "personal task DJ"** — suggests what to work on based on patterns
- **Evolution over perfection** — let usage patterns dictate structure

## System Structure

### Entry Point

**[[Task Management/INDEX]]** — Single entry point linking directly to project TASKS.md files.

### Project-Based Navigation

INDEX.md links directly to active project TASKS.md files organized by area:

```markdown
### [Area Name]
- [[Projects/PROJECT - Website Redesign/TASKS]] — Launch deadline Mar 15
- [[Projects/PROJECT - Mobile App/TASKS]] — Beta testing

### Other Areas
- [[Task Management/Misc/Personal]] — Health, admin
- [[Task Management/Misc/Learning]] — Courses, reading
```

### Misc/ Folder (Areas Without Projects)

For life areas that don't have dedicated project folders:
- **[[Task Management/Misc/Personal]]** — Health, home, errands
- **[[Task Management/Misc/Learning]]** — Courses, reading, skill development
- **[[Task Management/Misc/Side Projects]]** — Explorations without dedicated folders

These are created as needed — not all at once.

## User Interface Protocols

**User NEVER organizes directly.** Instead:
- Reports work done: "Worked on the landing page for 2 hours"
- Asks for suggestions: "Feeling scattered, what should I do?"
- Captures interests: "Found this course on design"
- Requests variety: "Bored with writing, need something different"

**Claude handles all:**
- Categorization and placement
- Priority adjustments
- Cross-linking to Second Brain notes and existing project folders
- Context caching in area pages
- Suggestion generation based on patterns

## TASKS.md Structure

Every project has one `TASKS.md` file. That file is the **single source of truth** for what needs to be done.

```markdown
# [Project Name] - Tasks

**Project:** [One-line description]
**Status:** [Current phase]
**Timeline:** [Key dates/deadlines]

---

## This Week
(Hard deadlines, blocking items, immediate priorities)

## Upcoming (Next 2-4 Weeks)
(Soft deadlines, things that need momentum)

## On Deck
(No hard timeline, but worth keeping visible — interesting, fun, or strategically important)

## Waiting On
(Blocked by external dependencies)

---

## Dependencies
- [[Link to blocker]] — Why it blocks

## Enables
- [[Link to downstream]] — What this unlocks

---

*Last updated: [date]*
```

**Why these sections:**
- **This Week:** Urgent/important items surface first
- **Upcoming:** Maintains visibility for near-term work
- **On Deck:** Serendipity layer — prevents things without deadlines from becoming invisible
- **Waiting On:** Clear separation of blocked vs. actionable

## Graph-Based Task Architecture

**Core Principle:** One task, one source of truth, multiple pointers.

```
TASKS.md (in project folder)     Gets linked FROM:
─────────────────────────────    ─────────────────────────
Single source of truth       ←── Task Management/INDEX.md
                             ←── Daily Notes
                             ←── Other related projects

Cross-project tasks live in Misc/[Area].md files.
No duplicated checkboxes. One task, multiple pointers.
```

### Task Placement

| Task Type | Where It Lives |
|-----------|----------------|
| Has a project folder | `TASKS.md` in project folder, *linked* from Task Management |
| No project folder yet | Directly in Task Management area page or Misc/ file |

## "What Should I Work On?" Query Protocol

When user asks for task suggestions:
1. Read `Task Management/INDEX.md`
2. Follow links to project TASKS.md files
3. Synthesize across all sources, pulling from:
   - This Week (hard deadlines)
   - Upcoming (momentum items)
   - On Deck (serendipity/variety)
4. Present options based on energy, variety, and priority

## Suggestion Algorithm Principles

1. **Energy matching** — Visual work when brain is fried, writing when focused
2. **Neglect detection** — Surface areas that haven't been touched
3. **Context switching** — Variety to prevent boredom
4. **Learning integration** — Mix doing with learning
5. **Momentum preservation** — Don't break active streaks unnecessarily

## Integration with Existing Project Structure

**Project folder standard structure:**
```
PROJECT - [Name]/
├── INDEX.md           # Navigation hub
├── TASKS.md           # Canonical action items
└── [other files]      # Development, research, etc.
```

**Task Management/INDEX.md contains:**
- Direct links to all active project TASKS.md files
- Links to Misc/ files for areas without projects
- Current focus deadlines at top

**For new projects:**
- Claude creates the project folder, INDEX.md, and TASKS.md
- Adds link to Task Management/INDEX.md
- For non-project tasks, adds to relevant Misc/ area file

## Index Maintenance

**After any project work session:**
1. Update `TASKS.md` in project folder (canonical source)
2. Update one-line status in `Task Management/INDEX.md` if needed
3. Log session to Daily Notes

**When creating a new project TASKS.md:**
1. Create TASKS.md in project folder using template
2. Add project link to `Task Management/INDEX.md` under appropriate section
3. For areas without project folders, add to `Task Management/Misc/[Area].md`

## Review Cadence

- **Daily:** Check "This Week" section of active project
- **Weekly:** Run `/project-review` to scan all task files
- **Monthly:** Run `/monthly-check` for system health

## Anti-Patterns

- Don't duplicate tasks in multiple files — link, don't copy
- Don't put tasks in daily notes — link TO the TASKS.md instead
- Don't let "This Week" accumulate — move stale items to Upcoming or remove them
- Don't let "On Deck" become a dumping ground — it's for things worth keeping visible

## Critical Reminders for Claude

1. **ALWAYS check [[Claude/Second Brain Guide.md]] first** — Master prompt takes precedence
2. **Then check this guide** for task/project specific protocols
3. **User never organizes** — that's Claude's job entirely
4. **Suggest, don't assign** — respect user's autonomy and energy
5. **Track patterns** to improve suggestions over time
6. **Link to existing project structures** — never duplicate established work

---

*Return to [[Claude/Second Brain Guide]] for main system overview*
