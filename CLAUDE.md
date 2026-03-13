# Second Brain - Claude Quick Reference

*Start here for navigation. See [[Claude/Second Brain Guide]] for detailed protocols.*

---

## Navigation Entry Point

**START HERE:** [[INDEX.md]] - Master directory of all work areas

---

## Where Things Go (Decision Tree)

| Query Type | Go To |
|------------|-------|
| "What should I work on?" | `Task Management/INDEX.md` → Follow links to `TASKS.md` files |
| "Show me project details" | `[Work Area]/PROJECT - [Name]/INDEX.md` |
| "Update task status" | **Update the project `TASKS.md` file**, not the area file |
| "What's blocking X?" | Check `Dependencies` sections in project `TASKS.md` |
| "What does X unlock?" | Check `Enables` sections in project `TASKS.md` |
| "Log this session" | `Claude/Daily Notes/YYYY-MM-DD.md` → link to updated `TASKS.md` |
| "System protocols" | `Claude/Second Brain Guide.md` |
| "Thought for the slipbox" | `Slipbox/INDEX.md` → create new note |
| Book notes / reading summary | `Slipbox/INDEX.md` → create note, link from relevant living docs |
| "Pull in [topic] knowledge" | `Library/INDEX.md` → find matching library |
<!-- Add your custom routes here -->

### Task Query Routing

**Task source of truth:** Project `TASKS.md` files, not Task Management area files.

| Query | Action |
|-------|--------|
| "What's the status of [project]?" | Read project `TASKS.md` |
| "Mark [task] done" | Update project `TASKS.md`, update area file "Latest" summary |
| "Add task to [project]" | Add to project `TASKS.md` |
| "What's blocking [project]?" | Check `Dependencies` section in `TASKS.md` |
| "What does completing [project] enable?" | Check `Enables` section in `TASKS.md` |
| Cross-project task | Add to `Task Management/Misc/[Area].md` directly |
| New project TASKS.md created | Add link to `Task Management/INDEX.md` |

---

## Navigation Flow

**For projects:** Root INDEX → Work Area INDEX → Project INDEX → Files

**For tasks:** Task Management/INDEX → Project TASKS.md (direct)

**For latest updates:** Use `tail=500` parameter on chronological files

---

## Critical Rules

- ALWAYS read INDEX.md when entering a folder
- TRUST wiki-links — no defensive directory listings
- Log sessions automatically (authorized)
- **Modifying files: Use `edit_file` to change existing content. If using `write_file`, read first — never blind overwrite.**

---

## Context Auto-Loading

When entering a Second Brain work area:
1. Read INDEX.md (standard behavior)
2. Check for `## Context Load` section
3. Load linked files (Global first, then Area)
4. Announce briefly: "Context: [file names]"

Rules:
- Load once per session, don't re-read on every folder entry
- Skip context loading for pure system queries (file ops, INDEX updates)
- Quick queries need no context announcement

---

## Session Start Checks

When starting a substantive session, briefly scan for issues worth surfacing.

**Timing-based:**
- Sunday without weekly review? → Offer to prep
- >10 days since last health check? → Mention it
- Deadline within 48 hours? → Surface it

**Drift-based:**
- Daily logs mention project work not reflected in Task Management? → Flag it
- Task marked "active" with no daily log activity in >7 days? → Ask if still active

**Constraints:**
- One line per issue, max 2-3 items total
- If nothing notable, say nothing — don't narrate the check
- Offer to fix, don't auto-fix without permission

**Example:**
> "Heads up: Daily logs show Project X work yesterday but Task Management still shows it blocked. Also, the Website launch deadline is in 5 days. Want me to sync the task status?"

---

## Navigation Execution Protocol

**For queries with clear patterns** (status updates, project details, task lists):

**Execute the full navigation chain without thinking blocks between steps.**

The INDEX structure eliminates ambiguity. Trust it.

**Standard execution:**
1. Read INDEX → Follow [[links]] → Read target file(s) → Synthesize answer
2. No deliberation between navigation steps
3. No "should I read this file?" uncertainty

**Only use thinking blocks when:**
- Synthesizing/analyzing what you found (after gathering data)
- Handling genuine ambiguity (missing files, broken links, unclear user intent)
- Making strategic decisions about complex queries requiring multiple areas

**Examples — DON'T think:**
- "Let me read the Projects INDEX" → Just read it
- "I should follow the Tasks link" → Just follow it
- "I'll check the latest updates" → Just use tail parameter

**Examples — DO think:**
- "User asked about 'that project' — which one?" → Think about context
- "Three different areas might have this info" → Think about search strategy
- "How do these development notes connect to the task list?" → Think about synthesis

---

## Detailed Guides (Load As Needed)

- **[[Claude/Second Brain Guide]]** - Full navigation, file operations, maintenance
- **[[Claude/Session & Activity Logging]]** - Daily notes, weekly logs, archives
- **[[Claude/System Maintenance]]** - Weekly health checks, audits
- **[[Task Management/Task Management System Guide]]** - Task methodology

---

## User Context

<!-- Customize these for your situation -->
- Your name: [Your Name]
- What you do: [Your work/interests]
- Communication style: Direct, honest
- Preferences: Chunked info, clear next steps

---

## Library System

Libraries are curated reference collections that Claude can pull into any project.
- **Location**: `Library/` at Second Brain root
- **When to load**: Check Library INDEX trigger contexts when entering related work
- **Claude's role**: Actively maintain `Synthesis/` docs when new sources are added
- **Adding sources**: When new book notes or resources are added, update the relevant `Synthesis/` doc and the library `INDEX.md` source catalog

---

*Quick reference only. For protocols: [[Claude/Second Brain Guide]]*
