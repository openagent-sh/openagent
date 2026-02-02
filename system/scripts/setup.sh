#!/bin/bash

# OpenAgent Setup Script
# Copies OpenAgent files to OpenCode config directory

set -e

echo "╔════════════════════════════════════════╗"
echo "║      OpenAgent Setup                   ║"
echo "╚════════════════════════════════════════╝"
echo ""

OPENAGENT_ROOT="$(pwd)"
OPENCODE_CONFIG="$HOME/.config/opencode"

# Check if OpenCode is installed
if ! command -v opencode &> /dev/null; then
    echo "❌ OpenCode is not installed."
    echo ""
    echo "Install it first: https://opencode.ai"
    echo "Then run this script again."
    exit 1
fi

echo "✓ OpenCode detected"
echo ""

echo "Copying OpenAgent files to OpenCode config..."
echo ""

# Function to safely copy files (skip if exists)
safe_copy() {
    local src="$1"
    local dest="$2"
    local name=$(basename "$src")
    
    if [[ -f "$dest/$name" ]]; then
        echo "  ⊘ Skipped $name (already exists)"
        return 1
    else
        cp "$src" "$dest/"
        echo "  ✓ Copied $name"
        return 0
    fi
}

# Copy agents
if [[ -d "$OPENAGENT_ROOT/system/agents" ]]; then
    echo "  → Agents:"
    mkdir -p "$OPENCODE_CONFIG/agents"
    for file in "$OPENAGENT_ROOT/system/agents/"*.md; do
        [[ -f "$file" ]] && safe_copy "$file" "$OPENCODE_CONFIG/agents"
    done
fi

# Copy commands
if [[ -d "$OPENAGENT_ROOT/system/opencode/commands" ]]; then
    echo "  → Commands:"
    mkdir -p "$OPENCODE_CONFIG/commands"
    for file in "$OPENAGENT_ROOT/system/opencode/commands/"*.md; do
        [[ -f "$file" ]] && safe_copy "$file" "$OPENCODE_CONFIG/commands"
    done
fi

# Copy skills
if [[ -d "$OPENAGENT_ROOT/system/skills" ]]; then
    echo "  → Skills:"
    mkdir -p "$OPENCODE_CONFIG/skills"
    for file in "$OPENAGENT_ROOT/system/skills/"*.md; do
        [[ -f "$file" ]] && safe_copy "$file" "$OPENCODE_CONFIG/skills"
    done
fi

# Copy plugins
if [[ -d "$OPENAGENT_ROOT/system/opencode/plugins" ]]; then
    echo "  → Plugins:"
    mkdir -p "$OPENCODE_CONFIG/plugins"
    for file in "$OPENAGENT_ROOT/system/opencode/plugins/"*; do
        [[ -f "$file" ]] && safe_copy "$file" "$OPENCODE_CONFIG/plugins"
    done
fi

echo ""
echo "✓ OpenAgent files copied (existing files were preserved)!"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Shell Alias (Optional)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "To make the 'openagent' command permanent, run ONE of these:"
echo ""
echo "For zsh (most macOS users):"
echo "  echo 'alias openagent=\"cd \$OPENAGENT_ROOT && opencode --agent openagent --prompt Hello\"' >> ~/.zshrc && source ~/.zshrc"
echo ""
echo "For bash:"
echo "  echo 'alias openagent=\"cd \$OPENAGENT_ROOT && opencode --agent openagent --prompt Hello\"' >> ~/.bashrc && source ~/.bashrc"
echo ""
echo "If you get API errors, add --model flag:"
echo "  alias openagent=\"cd \$OPENAGENT_ROOT && opencode --agent openagent --model anthropic/claude-sonnet-4-5 --prompt Hello\""
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Next Steps"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  1. (Optional) Add the alias above to your shell config"
echo ""
echo "  2. Run OpenCode:"
echo "     opencode"
echo ""
echo "  3. Start the onboarding to personalize your system:"
echo "     /onboarding"
echo ""
echo "  4. Or jump straight to OpenAgent:"
echo "     /openagent"
echo ""
echo "✓ Setup complete!"
