---
name: opencode-skill
description: OpenCode reference - terminal AI coding agent with full file/terminal access, extensible agents, plugins, skills, and CLI automation. Use for coding, devops, automation, and any terminal-based AI tasks.
version: 1.0.0
last_updated: 2026-01-28
---

# OpenCode Reference Skill

OpenCode is an open-source AI coding agent with full terminal and filesystem access - a terminal-first agent system built for real development work.

## Quick Start

```bash
# Install
curl -fsSL https://opencode.ai/install | bash

# Start TUI
opencode

# Continue previous session
opencode -c
opencode --continue

# Run single command
opencode run "Fix bug in auth.py"

# Start headless server
opencode serve

# Web interface
opencode web
```

## Core Concepts

### Agents

OpenCode has two built-in primary agents:

| Agent | Mode | Description |
|-------|------|-------------|
| **Build** | primary (default) | Full tool access, can edit files and run commands |
| **Plan** | primary | Read-only analysis, file edits and bash require approval |

**Switch agents** with the **Tab** key.

**Subagents** are specialized assistants invoked with `@`:

| Subagent | Purpose |
|----------|---------|
| `@general` | Complex research and multi-step tasks |
| `@explore` | Fast read-only codebase searches |

### Tools

OpenCode provides these tools to agents:

| Tool | Description |
|------|-------------|
| `read` | Read file contents with optional line ranges |
| `write` | Create new files or overwrite existing |
| `edit` | Modify files using exact string replacements |
| `patch` | Apply patch files |
| `grep` | Search file contents with regex |
| `glob` | Find files by pattern (`**/*.js`) |
| `list` | List files and directories |
| `bash` | Execute shell commands |
| `lsp` (experimental) | Language Server Protocol integration |
| `todowrite` | Create/update task lists |
| `todoread` | Read current todo state |
| `skill` | Load skill files into conversation |
| `webfetch` | Fetch and read web pages |
| `question` | Ask user clarifying questions |

### Permissions

Control what requires approval using `permission` in opencode.json:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "permission": {
    "edit": "ask",
    "bash": "ask"
  }
}
```

Values: `"allow"` (always run), `"ask"` (prompt user), `"deny"` (never run)

Pattern matching for bash commands:
```json
{
  "permission": {
    "bash": {
      "git status": "allow",
      "git push": "ask",
      "rm *": "deny"
    }
  }
}
```

## Configuration

### Config Precedence

Configs are **merged**, not replaced. Later sources override earlier:

1. Remote config (`.well-known/opencode`) - organizational defaults
2. Global config (`~/.config/opencode/opencode.json`) - user preferences
3. Custom config (`OPENCODE_CONFIG` env var) - custom overrides
4. Project config (`opencode.json` in project) - project-specific settings
5. `.opencode` directories - agents, commands, plugins
6. Inline config (`OPENCODE_CONFIG_CONTENT` env var) - runtime overrides

### Config File Structure

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "anthropic/claude-sonnet-4-5",
  "small_model": "anthropic/claude-haiku-4-5",
  "theme": "opencode",
  "tools": {
    "write": true,
    "bash": true
  },
  "agent": {
    "custom-agent": {
      "description": "My custom agent",
      "mode": "subagent",
      "model": "anthropic/claude-sonnet-4-20250514",
      "tools": {
        "write": false,
        "edit": false
      }
    }
  },
  "command": {
    "test": {
      "template": "Run tests with coverage",
      "agent": "build"
    }
  },
  "mcp": {
    "server-name": {
      "type": "remote",
      "url": "https://example.com/mcp"
    }
  }
}
```

### Models

OpenCode uses 75+ LLM providers via Models.dev and AI SDK.

```json
{
  "model": "anthropic/claude-sonnet-4-5"
}
```

## CLI Commands

### Interactive Mode

```bash
opencode                           # Start TUI
opencode /path/to/project          # Start in specific directory
opencode --continue                # Continue previous session
opencode --session <id>            # Continue specific session
opencode --model <provider/model>  # Use specific model
opencode --agent build             # Start with specific agent
```

### Non-Interactive Mode

```bash
opencode run "Explain this code"              # Single prompt
opencode run "Fix bug" --file auth.py         # With file attachment
opencode run "Review" --share                 # Auto-share result
opencode run --command "npm test"             # Run specific command
opencode run --attach http://localhost:4096   # Attach to running server
```

### Server Mode

```bash
opencode serve                    # Headless API server
opencode serve --port 3000        # Custom port
opencode serve --mdns             # Enable mDNS discovery
opencode attach http://10.0.0.5:4096  # Attach TUI to remote server
opencode web                      # Web interface with browser
```

### Management Commands

```bash
# Authentication
opencode auth login               # Configure API keys
opencode auth list                # List configured providers
opencode auth logout              # Remove provider credentials

# Models
opencode models                   # List available models
opencode models anthropic         # Filter by provider
opencode models --refresh         # Refresh model cache

# MCP Servers
opencode mcp add                  # Add MCP server (interactive)
opencode mcp list                 # List configured servers
opencode mcp auth <name>          # Authenticate with OAuth server
opencode mcp debug <name>         # Debug OAuth issues

# Sessions
opencode session list             # List all sessions
opencode session list -n 10       # Last 10 sessions

# Statistics
opencode stats                    # Token usage and costs
opencode stats --days 7           # Last 7 days
opencode stats --tools            # Top tools used
opencode stats --models 5         # Top 5 models used

# Export/Import
opencode export <sessionID>       # Export session as JSON
opencode import <file>            # Import from file or URL
opencode import https://<URL>

# Upgrade
opencode upgrade                  # Update to latest version


# GitHub Integration
opencode github install           # Install GitHub agent
opencode github run               # Run GitHub agent (for CI)
```

## Customization

### Custom Agents

Define agents via markdown files:

`~/.config/opencode/agent/review.md`:
```markdown
---
description: Code review without edits
mode: subagent
model: anthropic/claude-sonnet-4-5
tools:
  write: false
  edit: false
  bash: false
---
You are a code review agent. Focus on:
- Security vulnerabilities
- Performance issues
- Code quality
- Best practices

Provide feedback without making changes.
```

Use: `@review` in your prompt.

### Custom Commands

Create reusable prompts:

`.opencode/command/test.md`:
```markdown
---
description: Run tests with coverage
agent: build
model: anthropic/claude-sonnet-4-5
---
Run the full test suite with coverage. Focus on failing tests and suggest fixes.
```

Use: `/test` in the TUI.

With arguments:
```markdown
---
description: Create React component
---
Create a new React component named $ARGUMENTS with TypeScript.
```

Use: `/component Button`

Inject bash output:
```markdown
---
description: Analyze coverage
---
Current test results:
!`npm test -- --coverage`

Based on these results, suggest improvements.
```

### Skills

Skills are reusable knowledge packages loaded on demand.

**File locations** (discovered in order):
1. `.opencode/skills/<name>/SKILL.md` (project)
2. `~/.config/opencode/skills/<name>/SKILL.md` (global)
3. `.claude/skills/<name>/SKILL.md` (Claude-compatible)
4. `~/.claude/skills/<name>/SKILL.md` (Claude-compatible)

**Format:**
```markdown
---
name: git-release
description: Create consistent releases and changelogs
license: MIT
---
## What I do
- Draft release notes from merged PRs
- Propose a version bump
- Provide copy-pasteable release commands

## When to use me
Use when preparing a tagged release.
```

**Name rules:**
- Lowercase alphanumeric with single hyphens
- Cannot start/end with hyphens
- Must match directory name

**Load skills:**
```
skill({ name: "git-release" })
```

### Custom Tools

Define custom functions the LLM can call:

`.opencode/tool/database.ts`:
```typescript
import { tool } from "@opencode-ai/plugin"

export default tool({
  description: "Query the project database",
  args: {
    query: tool.schema.string().describe("SQL query to execute")
  },
  async execute(args) {
    // Your implementation
    return `Executed: ${args.query}`
  }
})
```

Multiple tools per file:
```typescript
import { tool } from "@opencode-ai/plugin"

export const add = tool({
  description: "Add two numbers",
  args: {
    a: tool.schema.number(),
    b: tool.schema.number()
  },
  async execute(args) {
    return args.a + args.b
  }
})

export const multiply = tool({
  description: "Multiply two numbers",
  args: {
    a: tool.schema.number(),
    b: tool.schema.number()
  },
  async execute(args) {
    return args.a * args.b
  }
})
```

Creates tools: `database`, `math_add`, `math_multiply`

## Best Practices

1. **Use Plan Mode First** - Switch to Plan agent (Tab) to review implementation strategy before making changes.

2. **File References** - Use `@filename` to fuzzy search and reference files in prompts.

3. **Undo Stack** - Use `/undo` liberally - changes are stackable and reversible with `/redo`.

4. **Session Management** - Use `--continue` or `-c` to maintain context across sessions.

5. **Config Merging** - Remember that configs are merged, not replaced.

6. **Permissions** - Set permissions to "ask" for destructive operations.

7. **Skills** - Load skills for reusable knowledge and workflows.

8. **Custom Agents** - Create specialized agents for recurring tasks.

### Plugins

Extend OpenCode with hooks and custom integrations:

`.opencode/plugin/example.ts`:
```typescript
import type { Plugin } from "@opencode-ai/plugin"

export const example: Plugin = async (input) => {
  const { client, project, directory, $ } = input

  return {
    tool: {
      myTool: tool({
        description: "My custom tool",
        args: { /* schema */ },
        async execute(args, context) { /* implementation */ }
      })
    },
    event: async ({ event }) => { /* handle events */ },
    config: async (config) => { /* modify config */ }
  }
}

export default example
```

**Available hooks:**
- `event` - Real-time events (session, message, file edits)
- `config` - Modify configuration on load
- `tool` - Register custom tools
- `auth` - Custom authentication providers
- `chat.message` - Modify messages before sending
- `chat.params` - Modify LLM parameters
- `permission.ask` - Handle permission requests
- `tool.execute.before` - Pre-process tool arguments
- `tool.execute.after` - Post-process tool output

## Agent Rules (AGENTS.md)

Define project-wide instructions loaded into all agents:

```
./AGENTS.md                    # Project rules (walks up to git root)
~/.config/opencode/AGENTS.md   # Global rules
```

Rules are merged with the system prompt. Use for:
- Project conventions (coding style, naming)
- Workflows (how to approach PRs, releases)
- Business logic (domain-specific requirements)

Example AGENTS.md:
```markdown
# Code Review Rules
- Always check for security vulnerabilities first
- Prefer functional over imperative style
- Require tests for new functions
- Max function length: 50 lines
```

Combine with config:
```json
{
  "instructions": ["CONTRIBUTING.md", "docs/*.md"]
}
```

## MCP Servers

Connect external tools via Model Context Protocol:

```bash
opencode mcp add              # Interactive setup
opencode mcp list             # Show configured servers
opencode mcp auth <name>      # OAuth authentication
opencode mcp debug <name>     # Debug connection issues
```

Example config:
```json
{
  "mcp": {
    "server-name": {
      "type": "remote",
      "url": "https://example.com/mcp"
    }
  }
}
```

## Session Management

```bash
opencode --continue           # Resume last session
opencode --session <id>       # Resume specific session
opencode session list         # List all sessions
opencode session list -n 10   # Last 10 sessions
opencode export <sessionID>   # Export as JSON
opencode import <file>        # Import from file or URL
```

## Troubleshooting

### Tool Not Appearing
- Verify file is in `.opencode/tool/` or `~/.config/opencode/tool/`
- Check file exports valid tool definition
- Restart OpenCode to reload tools

### Agent Not Loading
- Check agent config in `opencode.json` or `.opencode/agent/`
- Verify mode is "primary" or "subagent"
- Restart OpenCode

### Permission Denied Unexpectedly
- Check global vs project config precedence
- Verify permission settings (allow/ask/deny)
- Check for permission rules in agent config

### Skill Not Found
- Verify `SKILL.md` is spelled in all caps
- Check frontmatter includes `name` and `description`
- Ensure skill name matches directory name

## References

- Official Docs: https://opencode.ai/docs
- Config Schema: https://opencode.ai/config.json
- Plugins: https://opencode.ai/docs/plugins
- Ecosystem: https://opencode.ai/docs/ecosystem
- Models.dev: https://models.dev (75+ LLM providers)
