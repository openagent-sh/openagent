#!/bin/bash

# OpenAgent Setup Script
# Run this after cloning to personalize your instance

echo "🤖 OpenAgent Setup"
echo "=================="
echo ""

# Check if opencode is installed
if ! command -v opencode &> /dev/null; then
    echo "⚠️  OpenCode is not installed. Install it for the full experience:"
    echo "   https://opencode.ai"
fi

echo ""
echo "🔗 OpenCode Integration"
echo ""

OPENCODE_CONFIG="$HOME/.config/opencode"
OPENAGENT_ROOT="$(pwd)"
OPENAGENT_AGENTS="$OPENAGENT_ROOT/system/agents"
OPENAGENT_COMMANDS="$OPENAGENT_ROOT/system/opencode/commands"

# Check if user has existing OpenCode config
if [ -d "$OPENCODE_CONFIG/agent" ] || [ -d "$OPENCODE_CONFIG/command" ]; then
    echo "   ℹ️  Existing OpenCode config detected at $OPENCODE_CONFIG"
    echo ""
    echo "   You have two options:"
    echo ""
    echo "   Option A: Merge (recommended for existing users)"
    echo "   Copy OpenAgent agents/commands into your existing config:"
    echo "   cp -r $OPENAGENT_AGENTS/* $OPENCODE_CONFIG/agent/"
    echo "   cp -r $OPENAGENT_COMMANDS/* $OPENCODE_CONFIG/command/"
    echo ""
    echo "   Option B: Replace (fresh start)"
    echo "   Backup your config and symlink OpenAgent's:"
    echo "   mv $OPENCODE_CONFIG/agent $OPENCODE_CONFIG/agent.backup"
    echo "   ln -s $OPENAGENT_AGENTS $OPENCODE_CONFIG/agent"
    echo ""
    echo "   ⚠️  Skipping automatic symlinks to preserve your existing config."
else
    # No existing config, safe to symlink
    mkdir -p "$OPENCODE_CONFIG"

    ln -s "$OPENAGENT_AGENTS" "$OPENCODE_CONFIG/agent"
    echo "   ✅ Linked agents → $OPENCODE_CONFIG/agent"

    ln -s "$OPENAGENT_COMMANDS" "$OPENCODE_CONFIG/command"
    echo "   ✅ Linked commands → $OPENCODE_CONFIG/command"
fi

echo ""
echo "📝 Next steps:"
echo ""
echo "   1. Run onboarding to personalize your system:"
echo "      opencode"
echo "      Then type: /onboarding"
echo ""
echo "   2. Or manually edit these files:"
echo "      - AGENT.md (your personal context)"
echo "      - system/memory/MEMORY.md (long-term memory)"
echo ""
echo "   3. Start using OpenAgent:"
echo "      opencode"
echo "      Then type: /openagent"
echo ""
echo "✨ Setup complete!"
