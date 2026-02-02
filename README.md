# OpenAgent - Your Cofounder for Life

<img src="https://private-user-images.githubusercontent.com/203029907/543879632-c828df68-f914-4d6e-8f3c-4631e9cd9902.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzAwNDkwODYsIm5iZiI6MTc3MDA0ODc4NiwicGF0aCI6Ii8yMDMwMjk5MDcvNTQzODc5NjMyLWM4MjhkZjY4LWY5MTQtNGQ2ZS04ZjNjLTQ2MzFlOWNkOTkwMi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwMjAyJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDIwMlQxNjEzMDZaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02NTFhYTYzMzc0ZWRlNDg1NGQxZDMxYzFiZDdjNjdjYzlhMDk1MDM0OTQ1Y2Q1NGI2YjQ2YWMyZjJmZmJmMzAyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.eZfCs0htTxcEgkD5pRO6vwvBbUiynUMYc7VxvLarKLk" alt="OpenAgent Banner" width="100%">

<p align="center">
  <a href="https://opensource.org/license/mit"><img src="https://img.shields.io/badge/LICENSE-MIT-blue?style=flat-square&labelColor=333333" alt="License: MIT"></a>
  <a href="https://opencode.ai"><img src="https://img.shields.io/badge/BUILT%20WITH-OPENCODE-5DADE2?style=flat-square&labelColor=333333" alt="Built with OpenCode"></a>
  <a href="https://open-agent.sh"><img src="https://img.shields.io/badge/WEBSITE-open--agent.sh-52BE80?style=flat-square&labelColor=333333" alt="Website"></a>
  <a href="https://x.com/openagent_"><img src="https://img.shields.io/badge/X-@OPENAGENT__-666666?style=flat-square&labelColor=333333" alt="X"></a>
</p>

> Your personal AI cofounder for life.

A living AI agent system built on [OpenCode](https://opencode.ai) that makes you 10x more effective. Stop jumping between tools and contexts — build a system that grows with you.

---

## Features

- **Persistent Memory** — Short-term (weekly focus) and long-term (preferences, patterns, decisions) that grows with you
- **Workspaces** — Your work areas (dev projects, business, personal) with dedicated context
- **Smart Commands** — `/capture` for quick ideas, `/remember` for important notes, `/summarize` for session documentation
- **Specialized Agents** — 10+ specialized agents (development, frontend design, research, code review, onboarding) — all ready to use
- **Skills** — Built-in expertise on OpenCode and other tools
- **Fully Modular** — Customize agents, commands, skills — make it yours

---

![OpenAgent Demo](https://github.com/user-attachments/assets/dd1535eb-fa39-4e96-bf61-6d9e92d1e9a6)

---

## Why should i use this?

**The problem:** You use Claude Code, ChatGPT, OpenCode and Cursor - your context is scattered across different tools. Every time you start a new conversation, you're starting from zero.

**The solution:** OpenAgent gives you a persistent, personalized AI system that knows who you are, what you're working on, how you work and grows with you. It's your base system that you build up from.

Unlike other tools that overwhelm you with thousands of app connections and configuration options, OpenAgent focuses on what matters: getting things done. It's simple, modular and customizable to how you actually work.

---

## Quick Start

### Prerequisites
- [OpenCode](https://opencode.ai) installed
- Git

### Installation

**One-line install (recommended):**

```bash
cd ~ && curl -fsSL https://open-agent.sh/install | bash
```

This will:
- Download OpenAgent to `~/openagent`
- Run interactive setup
- Create symlinks to OpenCode config

**Manual install (for contributors):**

```bash
# Clone the repo
cd ~ && git clone https://github.com/openagent-sh/openagent
cd openagent

# Run setup
./system/scripts/setup.sh
```

### After Installation

```bash
# 1. (Optional) Add shell alias for easy launching
# For zsh (most macOS users):
echo 'alias openagent="cd $OPENAGENT_ROOT && opencode --agent openagent --prompt Hello"' >> ~/.zshrc && source ~/.zshrc

# For bash:
echo 'alias openagent="cd $OPENAGENT_ROOT && opencode --agent openagent --prompt Hello"' >> ~/.bashrc && source ~/.bashrc

# If you get API errors, add --model flag:
# alias openagent="cd $OPENAGENT_ROOT && opencode --agent openagent --model anthropic/claude-sonnet-4-5 --prompt Hello"

# 2. Start OpenCode
opencode

# 3. Personalize your system
/onboarding

# 4. Start using OpenAgent
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

## Onboarding

After setup, run `/onboarding` to personalize your system (takes 5-10 minutes).
The more information you share, the better your system will be set up

The onboarding flow will ask about:
- Your name (optional)
- Current projects and work areas
- Workspaces to create (dev, business, personal, etc.)
- Preferences and communication style
- This week's focus

After onboarding, you'll have:
- ✅ Personalized `AGENT.md` with your context
- ✅ Workspaces set up for your areas
- ✅ Long-term memory initialized
- ✅ This week's focus ready to go

**Note:** Technical setup (symlinks, agents, commands) is handled by `setup.sh` before onboarding.

[See full onboarding flow](system/agents/onboarding-agent.md)

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
│  openagent       │  │  opencode-skill  │  │  dev/            │
│  onboarding      │  │  frontend-design │  │  business/       │
│  capture-agent   │  │  skill-creator   │  │  personal/       │
│  developer-1     │  │  agent-browser   │  │  misc/           │
│  developer-2     │  │                  │  │                  │
│  frontend-design │  │                  │  │                  │
│  code-reviewer   │  │                  │  │                  │
│  opencode-agent  │  │                  │  │                  │
│  researcher      │  │                  │  │                  │
│  project-owner   │  │                  │  │                  │
└──────────────────┘  └──────────────────┘  └──────────────────┘
                                │
                                ▼
 ┌─────────────────────────────────────────────────────────────────┐
│                        COMMANDS                                 │
├──────────────────┬──────────────────┬──────────────────┬─────────┤
│ /openagent       │ /capture         │ /remember        │ /summarize │
│ Load full        │ Quick task       │ Save to          │ Session    │
│ context          │ to inbox         │ long-term        │ summary    │
├──────────────────┼──────────────────┼──────────────────┼─────────┤
│ /opencode-agent  │ /researcher      │ /developer-1     │ /project   │
│ System eng.      │ Tech research    │ Feature impl.    │ -owner     │
├──────────────────┴──────────────────┴──────────────────┴─────────┤
│ /frontend-designer                                            │
│ UI/UX polish                                                    │
└─────────────────────────────────────────────────────────────────┘
```

**How it works:**
1. **/openagent** loads your full context (SOUL + AGENT + Memory + Tasks)
2. **Agents** handle specialized work (dev, frontend design, onboarding, research)
3. **Skills** provide expertise (OpenCode customization, system documentation)
4. **Commands** capture ideas, save memories, summarize sessions, or spawn agents
5. **Workspaces** organize your projects by area

---

## Documentation

- [OpenCode Docs](docs/opencode) — Official OpenCode documentation
- [Sessions Template](system/memory/sessions/TEMPLATE.md) — Session summary format
- [Memory System](system/memory/README.md) — How memory works
- [Workspaces Guide](workspaces/README.md) — Organizing your work areas

**Symlink Setup:** OpenAgent uses symlinks to sync with OpenCode (`~/.config/opencode/` → `~/openagent/system/`). Changes are automatic both ways. Run `./system/scripts/setup.sh` to set up.

---

## Contributing

All sorts of contributions and requests are welcome <3

---

## FAQ

### What differentiates OpenAgent from clawdbot/moltbot/openclaw?

It's a way simpler system that is more focused on being your **personal cofounder for life**, focusing on your actual tasks instead of building email and calendar automations.

It's meant to be **customizable and modular from the ground up**, because everyone works differently.

### What features are planned?

- Support for other CLIs (claude code, droid, ...)
- A webapp with an agent orchestration view, dashboard, a clean markdown editor that is built AI native
- Extensions like Vercel Agent Browser, AI SDK, Exa AI websearch, ...

### How do I update OpenAgent?

OpenAgent checks for updates automatically when you run `/openagent`. When an update is available, you'll see a notification.

To update:
```bash
cd ~/openagent && ./system/scripts/update.sh
```

Your personal data (AGENT.md, memory, tasks, workspaces) is always preserved during updates.

---

## License

MIT

---

*Built with OpenCode — [opencode.ai](https://opencode.ai)*
