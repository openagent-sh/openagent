---
name: windows-install-skill
description: Windows install guide for OpenAgent (PowerShell-first), written for coding agents with troubleshooting and debug paths.
version: 1.0.0
last_updated: 2026-02-05
---

# Windows Install Skill

Use this skill when a user wants to install OpenAgent on Windows or troubleshoot a Windows install.

## Principles

- PowerShell-first. Do not assume Bash or Unix tools.
- Keep user files safe. Do not overwrite existing config unless asked.
- Prefer natural language steps; only generate short commands if the user asks.

## Optional: Use the original scripts

The original macOS/Linux scripts are in `system/scripts/setup.sh` and `install.sh`. A coding agent can read them as a reference for the intended flow and adapt the steps to Windows safely.

## Steps

1. Confirm prerequisites.
   - Git and OpenCode are installed and in PATH.
   - PowerShell 5.1+ (or 7+).
   - If missing, suggest OpenCode install options: Chocolatey, Scoop, npm, mise, or GitHub Releases.
2. Clone OpenAgent into the user's home directory (default `%USERPROFILE%\openagent`) or the path they prefer.
3. Determine the OpenCode config directory.
   - Default: `%USERPROFILE%\.config\opencode`
   - If `OPENCODE_CONFIG_DIR` is set, use that instead.
4. Copy OpenAgent system files into the OpenCode config directory, creating folders if needed.
   - `system/agents/*.md` -> `agents/`
   - `system/opencode/commands/*.md` -> `commands/`
   - `system/skills/*` -> `skills/`
   - `system/opencode/plugins/*` -> `plugins/`
   - Copy only when the destination file does not already exist.
5. Launch OpenCode and run onboarding.
   - Start OpenCode.
   - In the TUI run: `/onboarding`, then `/openagent`.

## If the user asks for exact PowerShell commands

Use short patterns like these (keep it minimal and safe):

- `git clone https://github.com/openagent-sh/openagent.git $env:USERPROFILE\openagent`
- `New-Item -ItemType Directory -Force -Path <path>`
- `if (-not (Test-Path <dest>)) { Copy-Item <src> <dest> }`

## Troubleshooting

- PowerShell `curl` is an alias for `Invoke-WebRequest`. The Unix one-liner `curl -fsSL ... | bash` only works in WSL or Git Bash.
- If `opencode` is not found, ensure it is installed and in PATH.
- If script execution is blocked, use `Set-ExecutionPolicy -Scope Process Bypass`.
- If symlinks are needed, run PowerShell as Administrator or enable Developer Mode.
- OpenCode debug paths (Windows): logs at `%USERPROFILE%\.local\share\opencode\log\` and storage at `%USERPROFILE%\.local\share\opencode\`.
