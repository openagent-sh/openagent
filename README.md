# OpenAgent

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Built with OpenCode](https://img.shields.io/badge/Built%20with-OpenCode-blue)
![Website](https://img.shields.io/badge/Website-open--agent.sh-green)
![X](https://img.shields.io/badge/X-%40openagent__-black)

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

```mermaid
graph TB
    subgraph "OpenCode CLI/TUI"
        CLI[/OpenCode Terminal/]
    end

    subgraph "Entry Points"
        CMD[/openagent]
        CMD2[/onboarding]
        CMD3[/capture]
        CMD4[/remember]
        CMD5[/summarize]
    end

    subgraph "Context (loaded by /openagent)"
        SOUL[SOUL.md<br/>Core identity & values]
        AGENT[AGENT.md<br/>Your personal context]
        MEMORY[Memory<br/>Short + Long term]
        INBOX[Tasks/Inbox<br/>Current work]
    end

    subgraph "System Components"
        AGENTS[Agents<br/>8 specialized agents]
        SKILLS[Skills<br/>OpenCode & expertise]
        COMMANDS[Commands<br/>capture/remember/summarize]
        WORKSPACES[Workspaces<br/>dev/business/personal]
        SCRIPTS[Scripts<br/>Setup & automation]
    end

    subgraph "Memory System"
        MEM_LONG[Long-term<br/>Preferences, Patterns, Timeline]
        MEM_SHORT[Short-term<br/>Weekly files]
        MEM_SESSION[Session Summaries<br/>Session docs]
    end

    subgraph "Agent Types"
        AG_CORE[OpenAgent<br/>Main system]
        AG_ONBOARD[Onboarding Agent<br/>Setup & personalization]
        AG_DEV[Developer Agents<br/>Code work]
        AG_FRONTEND[Frontend Designer<br/>UI/UX]
        AG_REVIEW[Code Reviewer<br/>Quality checks]
        AG_OCODE[OpenCode Agent<br/>Customization]
        AG_MEM[Memory Agent<br/>Session summaries]
        AG_CAP[Capture Agent<br/>Task inbox]
    end

    subgraph "Workspace Areas"
        WS_DEV[dev/<br/>Software projects]
        WS_BUS[business/<br/>Client work]
        WS_PER[personal/<br/>Life & hobbies]
        WS_MISC[misc/<br/>Everything else]
    end

    CLI --> CMD
    CLI --> CMD2
    CLI --> CMD3
    CLI --> CMD4
    CLI --> CMD5

    CMD --> SOUL
    CMD --> AGENT
    CMD --> MEMORY
    CMD --> INBOX

    SOUL -.-> AG_CORE
    AGENT -.-> AG_CORE

    AG_CORE --> AGENTS
    AG_CORE --> SKILLS
    AG_CORE --> COMMANDS
    AG_CORE --> WORKSPACES
    AG_CORE --> SCRIPTS

    AGENTS --> AG_ONBOARD
    AGENTS --> AG_DEV
    AGENTS --> AG_FRONTEND
    AGENTS --> AG_REVIEW
    AG_OCODE -.-> SKILLS
    AG_MEM -.-> COMMANDS
    AG_CAP -.-> COMMANDS

    MEMORY --> MEM_LONG
    MEMORY --> MEM_SHORT
    MEMORY --> MEM_SESSION

    WORKSPACES --> WS_DEV
    WORKSPACES --> WS_BUS
    WORKSPACES --> WS_PER
    WORKSPACES --> WS_MISC

    style CLI fill:#1f2937,stroke:#374151,stroke-width:2px,color:#fff
    style CMD fill:#3b82f6,stroke:#1e40af,stroke-width:3px,color:#fff
    style SOUL fill:#dbeafe,stroke:#2563eb
    style AGENT fill:#dbeafe,stroke:#2563eb
    style MEMORY fill:#fef3c7,stroke:#d97706
    style INBOX fill:#f3e8ff,stroke:#9333ea
    style AG_CORE fill:#3b82f6,stroke:#1e40af,stroke-width:2px,color:#fff

    classDef context fill:#dbeafe,stroke:#2563eb,stroke-width:2px
    classDef system fill:#e5e7eb,stroke:#374151
    classDef agent fill:#bfdbfe,stroke:#3b82f6
    classDef workspace fill:#ecfccb,stroke:#65a30d
    classDef memory fill:#fef3c7,stroke:#d97706

    SOUL:::context
    AGENT:::context
    MEMORY:::context
    INBOX:::context

    AGENTS:::system
    SKILLS:::system
    COMMANDS:::system
    WORKSPACES:::system
    SCRIPTS:::system

    AG_ONBOARD:::agent
    AG_DEV:::agent
    AG_FRONTEND:::agent
    AG_REVIEW:::agent
    AG_OCODE:::agent
    AG_MEM:::agent
    AG_CAP:::agent

    WS_DEV:::workspace
    WS_BUS:::workspace
    WS_PER:::workspace
    WS_MISC:::workspace

    MEM_LONG:::memory
    MEM_SHORT:::memory
    MEM_SESSION:::memory
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
/capture apply to vercel oss by monday

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

### Is my data private?

Yes. OpenAgent runs locally on your machine. Your memory, tasks, and AGENT.md are never sent anywhere (except to the AI models you choose to use via OpenCode).

---

## Tech Stack

- **CLI**: [OpenCode](https://opencode.ai) — The AI-powered terminal

---

## License

MIT

---

*Built with OpenCode — [opencode.ai](https://opencode.ai)*
