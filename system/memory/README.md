# Memory

OpenAgent's memory system (v2.0).

## Structure

```
system/memory/
├── MEMORY.md                    # Long-term: Preferences, Timeline, Patterns, Focus
├── short/
│   └── DD.MM.YYYY-DD.MM.YYYY.md      # Weekly files (Monday - Sunday)
├── sessions/
│   └── DD.MM.YYYY_memory_summarize_commands.md  # Full session summaries
└── README.md                    # This file
```

## Weekly File Naming

- Format: `DD.MM.YYYY-DD.MM.YYYY.md` (Monday date - Sunday date)
- Example: `27.01.2026-02.02.2026.md` (Monday Jan 27 - Sunday Feb 2, 2026)
- Content: Day-by-day sections (only fill relevant days)

## How It Works

### Short-term Memory (Weekly Files)
- One file per week
- Contains current focus, active threads, open questions
- Auto-detected by `/openagent` command
- Archived after 4+ weeks

### Long-term Memory (MEMORY.md)
- **Preferences** - User habits, communication style
- **Timeline** - Important decisions, milestones
- **Patterns** - Recurring themes with [PROMOTE +N] tags
- **Current Focus** - Active projects
- **Open Questions** - Unresolved topics

### Session Summaries
- Full session documentation in `sessions/`
- Created manually via `/summarize` command
- Separate from weekly files to avoid clutter

### Promotion Mechanism
- New learning → [PROMOTE +1] in MEMORY.md → ## Patterns
- Same learning seen again → Increment to [PROMOTE +2]
- At [PROMOTE +3] → Keep permanently (promoted)

## Manual Triggers

| Command | What it does | Writes to |
|---------|--------------|-----------|
| `/remember [text]` | Quick memory entry | MEMORY.md → Patterns |
| `/summarize` | Full session summary | sessions/DD.MM.YYYY...md |
| `/capture [text]` | Task to inbox | tasks/inbox/*.md |

## Key Principle

**Manual over automatic** - User controls what gets remembered via explicit commands. No background agents, no unexpected memory updates.
