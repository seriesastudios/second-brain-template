# Second Brain Template

A navigation-first personal knowledge system powered by [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

No programming or terminal experience required — Claude handles everything through conversation.

## What Is This?

A structured folder system that Claude Code understands natively. It organizes your projects, tasks, notes, and ideas using a simple convention: every folder has an `INDEX.md` file that tells Claude what's inside. Claude navigates by following links rather than searching, making it fast and reliable.

**What you get:**
- Organized project tracking with task management
- Automated session logging (Claude remembers what you worked on)
- Weekly/monthly review systems
- A growing knowledge base that connects ideas across areas
- Optional: automatic version history via git

## Prerequisites

**Required:**
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic's CLI tool)

**Optional (recommended):**
- `git` — Enables automatic version history and change tracking
- `jq` — Enables smarter session-start suggestions (time-based reminders)

> Both are optional. Everything works without them — you just won't get auto-commits or time-based suggestions.

## Getting Started

1. **Use this template** — Click "Use this template" on GitHub, or clone it:
   ```
   git clone https://github.com/YOUR_USERNAME/second-brain-template.git my-second-brain
   cd my-second-brain
   ```

2. **Open with Claude Code:**
   ```
   claude
   ```

3. **Run the setup wizard:**
   ```
   /onboarding
   ```

   The onboarding skill will:
   - Ask about your work areas and create folders for them
   - Set up your task management structure
   - Configure your preferences in CLAUDE.md
   - Initialize git (if available)
   - Run a health check to verify everything is set up correctly

4. **Start using it** — Just talk to Claude naturally:
   - "What should I work on this week?"
   - "Add a task to my [project] list"
   - "Show me the status of [project]"
   - "Log this session"

## How It Works

### Navigation-First Design

Every folder has an `INDEX.md` that acts as a table of contents. Claude reads these to navigate rather than searching your files, which means:
- Faster responses (direct navigation, not searching)
- Reliable routing (links, not guesses)
- Self-documenting structure (you can browse it too)

### Folder Structure

```
my-second-brain/
├── CLAUDE.md              # Claude's quick reference (routing table)
├── INDEX.md               # Master directory of everything
├── .claude/               # Claude Code configuration
│   ├── settings.json      # Hooks (auto-commit, link validation, etc.)
│   ├── commands/           # Slash commands (/weekly-check, etc.)
│   ├── skills/             # Complex multi-step workflows
│   └── hooks/              # Automation scripts
├── Claude/                # System management
│   ├── Daily Notes/       # Automatic session logs
│   ├── Weekly Logs/       # Curated weekly summaries
│   ├── Navigation Logs/   # Usage analytics
│   └── last-run.json      # Tracks when skills were last run
├── Task Management/       # Cross-project task tracking
├── Templates/             # File scaffolding
├── Projects/              # Your work areas (customize these)
├── Learning/              # Skills development
├── Library/               # Reference collections
└── Slipbox/               # Ideas and observations
```

### Built-in Commands

| Command | What It Does |
|---------|-------------|
| `/onboarding` | Interactive setup wizard |
| `/weekly-check` | Quick health + navigation check |
| `/monthly-check` | Comprehensive system health check |
| `/quarterly-check` | Navigation efficiency benchmark |
| `/project-review` | Review all tasks, find stale items, update status |
| `/query-optimize` | Analyze navigation logs and improve routing |

### Automation (Hooks)

- **Session Start:** Checks if weekly/monthly reviews are due, reminds you
- **On Edit/Write:** Validates wiki-links aren't broken
- **Session End:** Auto-commits changes to git (if git is available)
- **After Read/Glob/Grep:** Logs navigation for optimization analysis

## Customization

### It's Self-Organizing

You don't create folders or files manually. Just tell Claude what you need:

- "I'm starting a new project called X" → Claude creates the folder, INDEX, and task list
- "I want to track my learning in Y" → Claude sets up the area
- "This project is done, archive it" → Claude reorganizes

The system grows and restructures itself through conversation. Claude uses templates from `Templates/` automatically when scaffolding new files.

## Philosophy

- **Self-organizing** — You never touch the file system. Claude creates, organizes, and restructures everything through conversation
- **Start simple, add complexity only when patterns emerge** — If the same friction appears 3-4 times, then add structure
- **Navigation over search** — Direct paths are faster and more reliable than searching
- **Linear access time** — Information can grow infinitely, but finding things stays constant-time

## Contributing

Issues and PRs welcome. This template is designed to be opinionated but customizable — the core convention (INDEX.md navigation) should stay, but everything else can evolve.

## License

MIT
