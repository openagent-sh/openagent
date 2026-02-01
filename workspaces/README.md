# Workspaces

This folder contains workspace-specific documentation and detailed project context.

## Purpose

Workspaces are your "projects" or work areas - where you keep detailed, in-depth project files, notes, and context that goes beyond simple task entries.

## Example Workspaces

After running `/onboarding`, you'll have workspaces for your areas of focus:

```
workspaces/
├── work/         ← Professional work, main job
├── hobby/        ← Side projects, learning, personal interests
└── misc/         ← Everything else that doesn't fit
```

You can create as many workspaces as you need. Common examples:
- `dev/` - Software development projects
- `business/` - Client work, consulting
- `writing/` - Blog posts, documentation
- `health/` - Fitness tracking, meal planning

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
→ Move to: workspaces/work/
```

### 3. Create Workspace Context
For detailed project work:

```bash
# Create workspace files
workspaces/work/README.md
workspaces/work/NOTES.md
```

### 4. Reference from Tasks
Task files can reference workspaces:

```markdown
---
workspace: work
---

# Task Title

Related to: /workspaces/work/
```

## Integration with Tasks System

The new `/capture` command creates tasks in `/tasks/` with frontmatter linking to workspaces:

```yaml
---
workspace: work
importance: high
tags: [project, followup]
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
