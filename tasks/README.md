# Tasks

Central task management system for OpenAgent.

## Structure

```
tasks/
├── inbox/     ← New captures, unsorted
├── backlog/    ← Processed but not prioritized
└── README.md   ← This file
```

## How It Works

### 1. Capture (via `/capture`)
- New tasks go to `tasks/inbox/`
- Intelligent analysis by Capture Agent
- Frontmatter: workspace, importance, tags, reminder
- AI-generated subtasks and context

### 2. Process
- Review tasks in `tasks/inbox/`
- Move relevant tasks to:
  - **tasks/backlog/** - Processed, waiting
  - **workspaces/[workspace]/** - Active project files

### 3. Workspace Integration
- Workspaces in `/workspaces/` for detailed project context
- Smart linking via `workspace:` frontmatter
- Move tasks between inbox and workspaces as needed

## Task Format

```markdown
---
created: 2026-01-26
workspace: openagent
importance: medium
tags: [refactoring, tasks]
reminder: false
---

# Task Title

## Original Prompt
[Paste user's original input]

## AI Analysis
### Context
[Where did this come from]

### Relevant Workspaces
[List related workspaces]

### Subtasks
- [ ] Subtask 1
- [ ] Subtask 2
```

## Using Tasks

### Quick Capture
```bash
/capture we need to explore integrating xxx because...
```

### Move to Workspace
After capture, you'll be asked if you want to move to a workspace.

Available workspaces (customize these in AGENT.md):
- **openagent**: OpenAgent development
- **dev**: Development projects
- **business**: Business/client work  
- **personal**: Personal projects
- **misc**: Everything else

### Manage Backlog
Tasks in `tasks/backlog/` are processed but not yet prioritized.

### Workspace Files
For detailed project context with files, notes, etc., use `/workspaces/[workspace]/`

## Integration with Workspaces

Task files can reference workspaces via frontmatter:

```yaml
---
workspace: business
---
```

When a task needs detailed project context, it should be moved to `/workspaces/business/`

## Best Practices

1. **Capture frequently**: Use `/capture` for any task, idea, or reminder
2. **Let AI help**: Capture Agent analyzes, extracts tags, suggests structure
3. **Organize regularly**: Review inbox and move to backlog or workspaces
4. **Use workspaces for detail**: Keep workspace files for in-depth project work
5. **Trust the tags**: AI-generated tags help with future search

## Related Systems

- **/workspaces/** - Detailed project context
- **/system/tasks/*** - Main prioritization system (work.md, sidebusiness.md, etc.)
- **/capture** - Intelligent task capture command

---

*Tasks System - OpenAgent vBeta - 2026-01-26*
