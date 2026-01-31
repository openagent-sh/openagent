
# Troubleshooting

Common issues and how to resolve them.

To debug any issues with OpenCode, you can check the logs or the session data that it stores locally.

---

### [Logs](https://opencode.ai/docs/troubleshooting/#logs)

Log files are written to:

- **macOS/Linux**: `~/.local/share/opencode/log/`
- **Windows**: `%USERPROFILE%\.local\share\opencode\log\`

Log files are named with timestamps (e.g., `2025-01-09T123456.log`) and the most recent 10 log files are kept.

You can set the log level with the `--log-level` command-line option to get more detailed debug information. For example, `opencode --log-level DEBUG`.

---

### [Storage](https://opencode.ai/docs/troubleshooting/#storage)

opencode stores session data and other application data on disk at:

- **macOS/Linux**: `~/.local/share/opencode/`
- **Windows**: `%USERPROFILE%\.local\share\opencode`

This directory contains:

- `auth.json` - Authentication data like API keys, OAuth tokens
- `log/` - Application logs
- `project/` - Project-specific data like session and message data
    - If the project is within a Git repo, it is stored in `./<project-slug>/storage/`
    - If it is not a Git repo, it is stored in `./global/storage/`