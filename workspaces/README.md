# Workspaces

This folder contains workspace-specific documentation and detailed project context.

## Purpose

Workspaces are your "projects" or work areas - where you keep detailed, in-depth project files, notes, and context that goes beyond simple task entries.

## Available Workspaces

```
workspaces/
├── openagent/    ← OpenAgent development, system work
├── dev/          ← Software development projects
├── business/     ← Business/client work
├── personal/     ← Personal life, hobbies
└── misc/         ← Everything else
```

## Workspace Structure

Each workspace can have:

```
[workspace]/
├── README.md      - Workspace overview
├── TASKS.md       - Workspace-specific tasks (if needed)
├── NOTES.md       - Working notes, brainstorming
└── [other files] - Project-specific documents
```

## When to Use Workspaces vs Tasks

### Use /tasks/inbox or /tasks/backlog/:
- Quick tasks and ideas
- Short-term items
- Items that don't need detailed project context
- Task entries captured via `/capture`

### Use /workspaces/[workspace]/:
- Detailed project documentation
- Multi-step projects with their own structure
- Workspace-specific research and analysis
- Files that belong to a specific project
- When a task from /tasks/ needs dedicated project space

## Workflow

### 1. Start in /tasks/
```bash
/capture we need to explore integrating xxx...
```
→ Creates: `tasks/inbox/integrate_api_openagent.md`

### 2. Move to Workspace
When `/capture` asks if you want to move to workspace:

```bash
[User responds with workspace name]
→ Move to: workspaces/openagent/
```

### 3. Create Workspace Context
For detailed project work:

```bash
# Create workspace files
workspaces/openagent/README.md
workspaces/openagent/NOTES.md
```

### 4. Reference from Tasks
Task files can reference workspaces:

```markdown
---
workspace: openagent
---

# Task Title

Related to: /workspaces/openagent/
```

## Workspace Descriptions

### openagent/
OpenAgent personal AI operating system development.

- **Type**: Dev / System work
- **Contents**: Architecture, development, documentation
- **Related**: system/tasks/dev.md, SOUL.md

### dev/
Software development projects.

- **Type**: Development
- **Contents**: Coding projects, technical work, experiments
- **Related**: system/tasks/dev.md, AGENT.md

### business/
Business and client work.

- **Type**: Business
- **Contents**: Client projects, consulting, business tasks
- **Related**: system/tasks/business.md, AGENT.md

### personal/
Personal life and hobbies.

- **Type**: Personal
- **Contents**: Personal projects, hobbies, life management
- **Related**: system/tasks/personal.md, AGENT.md

### misc/
Everything else that doesn't fit into other workspaces.

- **Type**: Miscellaneous
- **Contents**: Explorations, experiments, uncategorized ideas
- **Related**: None (general)

## Integration with Tasks System

The new `/capture` command creates tasks in `/tasks/` with frontmatter linking to workspaces:

```yaml
---
workspace: business
importance: high
tags: [client, followup]
---
```

This allows:
- Tasks to be searchable by workspace
- Easy filtering in future Webapp
- Context-aware task management

## Migration Notes

Previously: `projects/`
Now: `workspaces/` (same concept, better naming)

The structure is identical - just renamed to match your mental model of "work areas" rather than "projects."

---

*Workspaces - OpenAgent vBeta - 2026-01-26*
