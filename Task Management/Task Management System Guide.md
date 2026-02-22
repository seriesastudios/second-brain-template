# Task Management System Guide

## Core Concept

Every project has one `TASKS.md` file. That file is the single source of truth for what needs to be done.

## Structure

```
[Work Area]/
  PROJECT - [Name]/
    INDEX.md      ← project overview
    TASKS.md      ← task list (source of truth)
    [other files]
```

## Task File Format

```markdown
# [Project Name] - Tasks

**Last updated:** YYYY-MM-DD

## This Week
- [ ] Immediate priorities

## Upcoming
- [ ] Next priorities

## Waiting On
- Items blocked on external dependencies

## Done
- [x] Completed items (moved here with date)
```

## Conventions

- **One TASKS.md per project** — never split tasks across files
- **"Last updated" date** — always update when modifying
- **Move, don't delete** — completed items go to "Done" section
- **Dependencies** — note what blocks a task and what completing it enables
- **Task Management/INDEX.md** — links to all TASKS.md files for cross-project view

## Review Cadence

- **Daily:** Check "This Week" section of active project
- **Weekly:** Run `/project-review` to scan all task files
- **Monthly:** Run `/monthly-check` for system health

## Anti-Patterns

- Don't duplicate tasks in multiple files
- Don't put tasks in daily notes (link TO the TASKS.md instead)
- Don't let "This Week" accumulate — move stale items to "Upcoming" or remove them
