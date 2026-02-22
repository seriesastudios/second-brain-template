---
name: onboarding
description: Interactive setup wizard for new Second Brain installations. Configures work areas, task management, identity, and git.
disable-model-invocation: true
---

# Second Brain Onboarding

Interactive setup wizard for configuring a new Second Brain.

## Instructions

### 1. Welcome

Greet the user and briefly explain what the Second Brain is:

> "Welcome to your Second Brain! This is a personal knowledge system that I (Claude) help you maintain. I'll organize your projects, track tasks, log our sessions, and connect ideas across your work areas.
>
> Let's set things up. I'll ask a few questions, then create your personalized structure."

### 2. Detect Environment

Silently check (no error messages to user):
- Is `git` available? (`command -v git`)
- Is `jq` available? (`command -v jq`)

Store these as internal flags for step 6.

### 3. Ask About Work Areas

Ask the user:

> "What are your main areas of work or life that you'd like to organize? These become your top-level folders.
>
> Examples: Projects, Freelance, Research, Health, Learning, Creative Writing, Business, etc.
>
> Tell me 2-5 areas to start with. You can always add more later."

For each area they mention:
- Create the folder with an `INDEX.md`
- Ask for a one-line description of what goes there

### 4. Set Up Task Management

For each work area created:
- Ask: "Do you have any active projects in [Area]? If so, name them."
- For each project: Create `[Area]/PROJECT - [Name]/INDEX.md` and `[Area]/PROJECT - [Name]/TASKS.md`
- Update `Task Management/INDEX.md` with links to all TASKS.md files

### 5. Configure Identity

Ask the user:

> "A few quick preferences to help me work better with you:"

Use `AskUserQuestion` for:
- "What's your name?" (free text)
- "What's your email? (optional — used for Google Calendar/Workspace integration if you use it)" (free text)
- "How do you prefer information delivered?" → Options: "Concise bullet points", "Detailed explanations", "Mix of both"

Update `CLAUDE.md` User Context section with their responses.

### 6. Configure Git

**If git IS available:**
- Run `git init` (if not already a git repo)
- Create `.gitignore` (if not already present)
- Stage all files and make initial commit: "Initial Second Brain setup"

**If git is NOT available:**
- Remove the `SessionEnd` hook block from `.claude/settings.json` (the auto-commit hook)
- Add a note to `CLAUDE.md` under User Context:
  > "Git is not configured. Your changes are saved locally but not version-controlled."
- Do NOT show any error messages about git being missing

### 7. Run First Health Check

Verify the structure:
- Check that all created INDEX.md files exist and have content
- Check that Task Management/INDEX.md links are valid
- Check that CLAUDE.md has been personalized
- Report: "Structure check: [X] folders, [Y] projects, [Z] task files. Everything looks good."

### 8. Show Next Steps

Present a summary:

```
## Your Second Brain is ready!

### What was created:
- [List of work areas and projects]
- Task management structure
- System automation (session logging, health checks)

### How to use it:
- **Just talk to me naturally** — "What should I work on?", "Add a task to [project]", "Log this session"
- **Weekly review:** Run `/weekly-check` on Sundays
- **Project review:** Run `/project-review` to update all task lists
- **Monthly health check:** Run `/monthly-check`

### Tips:
- I'll automatically log our work sessions — no action needed from you
- Say "thought for the slipbox" to capture a quick idea
- I navigate by following links in INDEX.md files, so everything stays fast
```

If git was skipped, add:
> "Optional: Install git for automatic version history of your Second Brain."
