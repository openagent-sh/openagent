---
created: 2026-02-01
workspace: openagent
importance: medium
tags: [future-ideas, enhancements, features, roadmap]
reminder: false
---

# Future OpenAgent Enhancements & Ideas

## Original Prompt

From session on 2026-02-01: After comprehensive system review and fixes, compile remaining good ideas and potential improvements for future implementation.

## AI Analysis

### Context

These ideas emerged from a thorough review of the OpenAgent system. They were identified as valuable enhancements but deferred in favor of foundational fixes (setup/onboarding overhaul, documentation consistency, symlink approach).

All items are organized by category and priority based on user impact and system complexity.

### High Priority Enhancements

#### 1. Skills Auto-loading for Agents
**Status:** Next priority item (Item 6 from session)

- frontend-designer-agent should auto-load frontend-design-skill
- opencode-agent should auto-load opencode-skill
- Add skill loading instructions/references in agent frontmatter
- Makes agents more powerful out of the box

#### 2. Weekly Review Command (`/week-start` or `/week-review`)
**User feedback:** "could be something that you would do every sunday"

- Reviews what you did this week
- Plans next week with you
- Auto-creates new weekly file with template
- Summarizes previous week's accomplishments
- Sets focus for upcoming week

#### 3. Capture Agent Improvements
**User feedback:** "capture agent some tweaks save thought for later"

- Duplicate detection: "Similar task found: [link]. Still create new one?"
- Smarter analysis of context
- Better workspace detection
- Learn from past task patterns

#### 4. Reminder/Notification System
**User feedback:** "reminder/notification system, save thought for later yes"

- Tasks have `reminder: true` and `reminder_date` but no mechanism to surface them
- `/reminders` command to show upcoming/overdue reminders
- Daily reminder check on `/openagent` launch
- Integration with weekly focus

### Medium Priority Features

#### 5. Archive Mechanism for Old Weekly Files
**Current status:** Documented but not implemented

- Automatically archive weekly files older than 4+ weeks
- Move to `system/memory/short/archive/YYYY-MM/`
- Keep searchable but out of active context
- Prevent memory bloat over time

#### 6. Workspace Context Loading
**User note:** "could be something... save that thought for later"

- `/workspace dev` command to load focused context
- Loads: workspace README + related tasks + relevant memory
- Pairs with `/openagent` for focused work sessions
- Quick workspace switching

#### 7. Context Diffing (Session-to-Session Awareness)

- Show what changed since last session
- "You added 3 tasks, updated AGENT.md, captured 2 learnings"
- Helps maintain continuity between sessions
- Could be part of `/openagent` startup

#### 8. Memory Search
**Note:** "not yet relevant" currently, but will be as memory grows

- `/search "keyword"` across MEMORY.md, weekly files, sessions
- Full-text search through all memory systems
- As memory grows, need to find things quickly
- Could use ripgrep or similar

### Lower Priority / Future Considerations

#### 9. Pattern Promotion Logic Refinement
**User note:** "dont know if it works... save for later"

- [PROMOTE +N] mechanism exists but unclear who increments it
- Should /remember or openagent auto-increment when seeing patterns?
- Logic for automatic promotion at +3
- Review mechanism for patterns

#### 10. Self-Improvement Tracking
**User note:** "it should be, but how he actually does we will have to figure out at later stage"

- Meta-learning: tracking what workflows work, what doesn't
- SOUL.md mentions "OpenAgent helps improve itself" but no concrete mechanisms
- Could track command usage, successful patterns, common issues
- Agent performance metrics

#### 11. Workspace-Specific Features

- Task templates by workspace (`workspaces/dev/TASK_TEMPLATE.md`)
- Different task structures for different workspaces
- Workspace-specific README templates
- Better integration between workspace context and tasks

#### 12. Inbox Review/Triage Command

- `/review-inbox` or `/triage`
- Shows inbox tasks with AI suggestions
- Prompts for workspace moves
- Helps with prioritization
- **User note:** "inbox check gets done with openagent itself" - maybe not needed as separate command

#### 13. Daily Review Trigger

- `/daily` command for end-of-day reflection
- Weekly files organized by day but no daily workflow currently
- Quick capture of what was done today
- Sets tomorrow's focus

#### 14. Git Integration for Memory

- Auto-commit memory changes with meaningful messages
- Version control for MEMORY.md, weekly files, sessions
- Track evolution of thinking over time
- Rollback capability if needed

#### 15. Skills Discovery

- `/skills` command to list available skills
- Describe what each skill provides
- Show which agents use which skills
- Help users understand skill system

#### 16. Agent Hierarchy/Session Tracking

- Track which agent spawned which subagent
- Agent session logs showing parent/child relationships
- Visibility into agent orchestration
- Debug agent workflows

#### 17. AGENT.md Validation

- `/check-setup` command
- Verifies AGENT.md is complete
- Checks for missing sections
- Suggests improvements to user context

#### 18. OPENAGENT_ROOT Environment Variable

- Set system-wide env var for OpenAgent path
- Simplifies shell alias
- Makes scripts more portable
- Only if needed for advanced setups

### Deferred / Very Low Priority

#### 19. Multi-User or Shared Context

- Currently single-user system
- Teams might want shared OpenAgent setup
- Shared workspaces with private memory
- Future consideration, not immediate need

#### 20. Memory Sections Customization

- Currently hard-coded: Preferences, Timeline, Patterns, Current Focus, Open Questions
- Allow user-configurable sections in AGENT.md
- More flexible memory structure
- Low priority - current structure works well

#### 21. Context Summarization Strategy

- As memory grows infinitely, how to prevent overload?
- Automatic compression of old weeks into summaries?
- Smart context windowing
- Long-term scalability consideration

## Subtasks

### Immediate Next Steps
- [ ] Review this list with user and prioritize top 3-5 items
- [ ] Create separate detailed task files for prioritized items
- [ ] Move this to backlog after initial review

### Implementation Phases (Suggested)

**Phase 1: Core Workflows (High Priority)**
- [ ] Skills auto-loading for agents
- [ ] Weekly review command
- [ ] Capture agent improvements
- [ ] Reminder system

**Phase 2: Memory & Organization (Medium Priority)**
- [ ] Archive mechanism
- [ ] Workspace context loading
- [ ] Context diffing
- [ ] Memory search

**Phase 3: Polish & Intelligence (Lower Priority)**
- [ ] Pattern promotion logic
- [ ] Self-improvement tracking
- [ ] Workspace-specific features
- [ ] Daily review trigger

**Phase 4: Advanced Features (Future)**
- [ ] Git integration
- [ ] Agent hierarchy tracking
- [ ] Multi-user support
- [ ] Context summarization

## Related Items

- Session summary: `system/memory/sessions/01.02.2026_openagent_system_review.md`
- Original brainstorming: Session message history from 2026-02-01

## Notes

This represents the consolidated future roadmap for OpenAgent enhancements. Items are organized by priority but should be re-evaluated based on:
- User needs as they emerge
- System usage patterns
- Community requests (if open-sourced)
- Technical dependencies

Some items marked "save for later" by user indicate they're good ideas but timing isn't critical. Should revisit quarterly or when relevant need arises.
