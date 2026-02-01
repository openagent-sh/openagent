#!/bin/bash

# OpenAgent Setup Script
# Run this after cloning to personalize your instance

echo "OpenAgent Setup"
echo "==============="
echo ""

OPENAGENT_ROOT="$(pwd)"

# Check if opencode is installed
if ! command -v opencode &> /dev/null; then
    echo "OpenCode is not installed."
    echo "Install it first: https://opencode.ai"
    echo ""
    echo "Then run this script again."
    exit 1
fi

echo "OpenCode detected."
echo ""

# OpenCode Integration
echo "OpenCode Integration"
echo ""

OPENCODE_CONFIG="$HOME/.config/opencode"
OPENAGENT_AGENTS="$OPENAGENT_ROOT/system/agents"
OPENAGENT_COMMANDS="$OPENAGENT_ROOT/system/opencode/commands"

# Check if user has existing OpenCode config
if [ -d "$OPENCODE_CONFIG/agent" ] || [ -d "$OPENCODE_CONFIG/command" ]; then
    echo "Existing OpenCode config detected at $OPENCODE_CONFIG"
    echo ""
    echo "You have two options:"
    echo ""
    echo "  Option A: Merge (recommended for existing users)"
    echo "  Copy OpenAgent agents/commands into your existing config:"
    echo "  cp -r $OPENAGENT_AGENTS/* $OPENCODE_CONFIG/agent/"
    echo "  cp -r $OPENAGENT_COMMANDS/* $OPENCODE_CONFIG/command/"
    echo ""
    echo "  Option B: Replace (fresh start)"
    echo "  Backup your config and symlink OpenAgent's:"
    echo "  mv $OPENCODE_CONFIG/agent $OPENCODE_CONFIG/agent.backup"
    echo "  mv $OPENCODE_CONFIG/command $OPENCODE_CONFIG/command.backup"
    echo "  ln -s $OPENAGENT_AGENTS $OPENCODE_CONFIG/agent"
    echo "  ln -s $OPENAGENT_COMMANDS $OPENCODE_CONFIG/command"
    echo ""
    echo "Skipping automatic symlinks to preserve your existing config."
else
    # No existing config, safe to symlink
    mkdir -p "$OPENCODE_CONFIG"

    ln -s "$OPENAGENT_AGENTS" "$OPENCODE_CONFIG/agent"
    echo "Linked agents -> $OPENCODE_CONFIG/agent"

    ln -s "$OPENAGENT_COMMANDS" "$OPENCODE_CONFIG/command"
    echo "Linked commands -> $OPENCODE_CONFIG/command"
fi

echo ""
echo "Shell Alias"
echo ""
echo "Add this to your ~/.zshrc (or ~/.bashrc):"
echo ""
echo "  alias openagent=\"cd $OPENAGENT_ROOT && opencode --agent openagent --prompt Hello\""
echo ""
echo "NOTE: If you get an API error, add --model flag:"
echo "  alias openagent=\"cd $OPENAGENT_ROOT && opencode --agent openagent --model YOUR_PROVIDER/MODEL --prompt Hello\""
echo ""
echo "Examples: --model anthropic/claude-sonnet-4-5 or --model openai/gpt-4o"
echo ""

echo "Next steps:"
echo ""
echo "  1. Add the alias above to your shell config"
echo ""
echo "  2. Run: source ~/.zshrc"
echo ""
echo "  3. Run onboarding to personalize your system:"
echo "     opencode"
echo "     Then type: /onboarding"
echo ""
echo "  4. Or just start using OpenAgent:"
echo "     openagent"
echo ""
echo "Setup complete!"
