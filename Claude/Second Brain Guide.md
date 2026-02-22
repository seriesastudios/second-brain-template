# Second Brain Guide

*Keep it simple. Add complexity only when patterns emerge.*

---

## Core Philosophy

- AI amplifies your skills, doesn't replace them
- Claude handles organization, you provide content
- Start simple, evolve through usage
- Goal: Build capabilities, not dependencies

**Design Principle:** System must grow linearly — information can expand infinitely, but access/update time stays constant. One-line logs, batch updates, natural navigation.

---

## Navigation Protocol - CRITICAL

**ALWAYS navigate first, search only as last resort backup.**

### Primary Navigation Flow
1. **Start at root:** [[INDEX]] is the master index — summarizes all work areas
2. **Topic-based routing:** Read work area INDEX for project overview
3. **Follow markdown links:** Use [[double bracket]] connections between files
4. **Project level:** Navigate to project INDEX via work area links
5. **Daily/weekly logs:** Check [[Claude/Activity Log]] for recent context

**INDEX.md Convention — RECURSIVE STRUCTURE:**
- **Root INDEX:** Summarizes all work areas
- **Work Area INDEX:** Summarizes all projects in that area
- **Project INDEX:** Summarizes all files in that project
- Each level points down one level
- Claude ALWAYS reads INDEX.md when entering any folder
- INDEX is the SOURCE OF TRUTH for what exists and where

### Search Only When Navigation Fails
- Use filesystem search only if topic routing + links don't find information
- Suggest missing links to improve future discoverability

---

## File Operation Safety - CRITICAL

**FILE MODIFICATION RULES:**
- **ALWAYS use edit for existing files** with content
- **NEVER blind-overwrite** existing files (destroys content)
- **Read file first** before any modification to understand current content
- **Only use write** for brand new files or deliberate complete rewrites

---

## INDEX Maintenance Protocol - CRITICAL

**When to Update INDEX Files:**

1. **Immediately after creating new content:**
   - New file in project folder → Update project INDEX
   - New project in work area → Update work area INDEX
   - New work area → Update root INDEX

2. **During navigation if you spot orphaned files:**
   - File exists but not in INDEX → Add it immediately

3. **Weekly review audit:**
   - Check each active project INDEX against actual files
   - Check each work area INDEX against actual projects
   - Check root INDEX against actual work areas

**The Rule:** INDEX files are NEVER optional maintenance. They are part of the creation process itself.

---

## Specialized Guides (Load As Needed)

**For Session Logging:**
→ [[Claude/Session & Activity Logging]] - Daily notes, weekly logs, multi-layer redundancy system

**For System Maintenance:**
→ [[Claude/System Maintenance]] - Weekly health checks, file placement audits, when to add complexity

---

## Simple Protocols

### For Most Conversations
1. Help with the immediate need
2. If it's substantial work, log it automatically to daily notes (no permission needed)
3. If it's a new idea/project, create a file
4. That's it

### When User Mentions Resources
- Add to learning queue in relevant task area
- Keep it simple: Title, type, why it matters

---

## Pattern Detection Rule

When same pattern appears 3-4 times, suggest structure.

**Add complexity only when:**
- Current approach creates friction
- User explicitly asks for more structure

**Don't add when:**
- It's just once or twice
- Current simple approach is working

---

*Remember: The user's instinct for simplicity is right. Follow their lead, not your complexity bias.*
