# OpenAgent - Your Cofounder for Life

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit)
[![Built with OpenCode](https://img.shields.io/badge/Built%20with-OpenCode-blue)](https://opencode.ai)
[![Website](https://img.shields.io/badge/Website-open--agent.sh-green)](https://open-agent.sh)
[![X](https://img.shields.io/badge/X-%40openagent__-black)](https://x.com/openagent_)

> Your personal AI cofounder for life.

A living AI agent system built on [OpenCode](https://opencode.ai) that makes you 10x more effective. Stop jumping between tools and contexts — build a system that grows with you.

---

## Why OpenAgent?

**The problem:** You use Claude Code, ChatGPT, OpenCode and Cursor - your context is scattered across different tools. Every time you start a new conversation, you're starting from zero.

**The solution:** OpenAgent gives you a persistent, personalized AI system that knows who you are, what you're working on, and how you work. It's your base system that you build up from.

Unlike other frameworks that overwhelm you with thousands of app connections and configuration options, OpenAgent focuses on what matters: getting things done. It's simple, modular and customizable to how you actually work.

---

## Features

- **Persistent Memory** — Short-term (weekly focus) and long-term (preferences, patterns, decisions) that grows with you
- **Workspaces** — Your work areas (dev projects, business, personal) with dedicated context
- **Smart Commands** — `/capture` for quick ideas, `/remember` for important notes, `/summarize` for session documentation
- **Specialized Agents** — Onboarding, code review, frontend design, development — all ready to use
- **Skills** — Built-in expertise on OpenCode and other tools
- **Fully Modular** — Customize agents, commands, skills — make it yours

---

![OpenAgent Demo](public/demo.gif)

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                         OPENAGENT                               │
│                  Personal AI Cofounder System                   │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        OPENCODE CLI                             │
│  Terminal TUI • Agents • Commands • Skills • Plugins            │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                      CONTEXT LAYER                              │
├────────────────┬────────────────┬────────────────┬──────────────┤
│   SOUL.md      │   AGENT.md     │    Memory      │    Tasks     │
│  (Identity)    │    (User)      │                │              │
│                │                │  ┌──────────┐  │  ┌────────┐  │
│  Core values   │  Your context  │  │MEMORY.md │  │  │ inbox/ │  │
│  How agent     │  Professional  │  │(long)    │  │  │backlog/│  │
│  operates      │  Preferences   │  ├──────────┤  │  └────────┘  │
│                │  Goals         │  │ short/   │  │              │
│                │                │  │(weekly)  │  │              │
│                │                │  ├──────────┤  │              │
│                │                │  │sessions/ │  │              │
│                │                │  │(logs)    │  │              │
│                │                │  └──────────┘  │              │
└────────────────┴────────────────┴────────────────┴──────────────┘
                               │
         ┌─────────────────────┼─────────────────────┐
         ▼                     ▼                     ▼
┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│     Agents       │  │     Skills       │  │   Workspaces     │
│                  │  │                  │  │                  │
│  onboarding      │  │  opencode-skill  │  │  dev/            │
│  developer-1     │  │  frontend-design │  │  business/       │
│  developer-2     │  │  skill-creator   │  │  personal/       │
│  frontend-design │  │                  │  │  misc/           │
│  memory-agent    │  │                  │  │                  │
│  opencode-agent  │  │                  │  │                  │
└──────────────────┘  └──────────────────┘  └──────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        COMMANDS                                 │
├────────────────┬────────────────┬────────────────┬──────────────┤
│  /openagent    │   /capture     │   /remember    │  /summarize  │
│  Load full     │   Quick task   │   Save to      │  Session     │
│  context       │   to inbox     │   long-term    │  summary     │
└────────────────┴────────────────┴────────────────┴──────────────┘
```

**How it works:**
1. **/openagent** loads your full context (SOUL + AGENT + Memory + Tasks)
2. **Agents** handle specialized work (dev, frontend design, onboarding)
3. **Skills** provide expertise (OpenCode customization, system documentation)
4. **Commands** capture ideas, save memories, summarize sessions
5. **Workspaces** organize your projects by area

---

## Onboarding

New to OpenAgent? Run `/onboarding` to get set up in 5-10 minutes.

The onboarding flow will:
- Collect your name (optional)
- Understand your current projects and work areas
- Set up workspaces (dev, business, personal, misc)
- Configure your preferences and communication style
- Enable the agents and commands you want to use
- Add shell integration (optional)
- Capture this week's focus

After onboarding, you'll have:
- ✅ Personalized `AGENT.md` with your context
- ✅ Workspaces set up for your areas
- ✅ This week's focus ready to go
- ✅ Commands enabled and ready to use

[See full onboarding flow](system/agents/onboarding-agent.md)

---

## Quick Start

### Prerequisites
- [OpenCode](https://opencode.ai) installed
- Git

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/openagent-sh/openagent
cd openagent

# 2. Run setup
./system/scripts/setup.sh

# 3. Fill in your context
# Edit AGENT.md with your personal information

# 4. Start OpenCode
opencode

# 5. Start the onboarding
/onboarding

# 6. Then run OpenAgent
/openagent
```

### Your First Actions

```bash
# Capture a quick idea
/capture add dark mode to the dashboard

# Save something to remember
/remember stop running the dev server!!!!

# End your session with a summary for future references
/summarize 
```

---

## Documentation

- [OpenCode Docs](docs/opencode) — Official OpenCode documentation
- [Sessions Template](system/memory/sessions/TEMPLATE.md) — Session summary format
- [Memory System](system/memory/README.md) — How memory works
- [Workspaces Guide](workspaces/README.md) — Organizing your work areas

---

## Contributing

Contributions are welcome! Whether it's bug fixes, new agents, plugins, or feature ideas.

**Before contributing:**
1. Open an issue to discuss major changes
2. Keep changes focused and well-documented
3. Follow the existing code style and structure
4. Test your changes thoroughly

**Areas that need help:**
- More specialized agents
- Better documentation
- Testing on different platforms
- Skill packs for popular tools

---

## FAQ

### What differentiates OpenAgent from clawdbot/moltbot/openclaw?

It's a way simpler system that is more focused on being your **personal cofounder for life**, focusing on your actual tasks instead of building email and calendar automations.

It's meant to be **customizable and modular from the ground up**, because everyone works differently.

### What features are planned?

- Support for other CLIs (claude code, droid, ...)
- A webapp with an agent orchestration view, dashboard, a clean markdown editor that is built AI native
- Extensions like Vercel Agent Browser, AI SDK, Exa AI websearch, ...

### Do I need to use all of the features?

No. Start with `/openagent` and the basic commands. Add agents, skills, and workflows as you need them. The system grows with you.

### Can I customize the agents?

Absolutely. All agents are in `system/agents/` — edit them, create your own, remove what you don't use. It's your system.

---

## License

MIT

---

*Built with OpenCode — [opencode.ai](https://opencode.ai)*
