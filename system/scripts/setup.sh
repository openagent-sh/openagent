#!/bin/bash

# OpenAgent Setup Script
# Sets up OpenCode integration with symlinks

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

# Check for existing OpenCode configuration
HAS_AGENTS=false
HAS_COMMANDS=false
HAS_SKILLS=false
HAS_PLUGINS=false

[[ -d "$OPENCODE_CONFIG/agents" || -d "$OPENCODE_CONFIG/agent" ]] && HAS_AGENTS=true
[[ -d "$OPENCODE_CONFIG/commands" || -d "$OPENCODE_CONFIG/command" ]] && HAS_COMMANDS=true
[[ -d "$OPENCODE_CONFIG/skills" || -d "$OPENCODE_CONFIG/skill" ]] && HAS_SKILLS=true
[[ -d "$OPENCODE_CONFIG/plugins" || -d "$OPENCODE_CONFIG/plugin" ]] && HAS_PLUGINS=true

if [[ "$HAS_AGENTS" == true ]] || [[ "$HAS_COMMANDS" == true ]]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Existing OpenCode Configuration Detected"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "You have existing agents/commands in: $OPENCODE_CONFIG"
    echo ""
    echo "Merging your existing files into OpenAgent and symlinking for auto-sync..."
    echo ""
    
    # NOTE: We always merge & symlink for the best experience.
    # If you need to keep configs separate, you can manually copy files instead:
    # cp -r system/agents/*.md ~/.config/opencode/agents/
    # cp -r system/opencode/commands/*.md ~/.config/opencode/commands/
    
    if true; then
        echo "Moving existing files to OpenAgent..."
        
        # Move agents
        if [[ -d "$OPENCODE_CONFIG/agents" ]] || [[ -d "$OPENCODE_CONFIG/agent" ]]; then
            AGENT_DIR="${OPENCODE_CONFIG}/agents"
            [[ -d "$OPENCODE_CONFIG/agent" ]] && AGENT_DIR="${OPENCODE_CONFIG}/agent"
            
            if [ "$(ls -A "$AGENT_DIR" 2>/dev/null)" ]; then
                cp "$AGENT_DIR"/*.md "$OPENAGENT_ROOT/system/agents/" 2>/dev/null || true
                echo "  ✓ Moved agents"
            fi
            rm -rf "$AGENT_DIR"
        fi
        
        # Move commands
        if [[ -d "$OPENCODE_CONFIG/commands" ]] || [[ -d "$OPENCODE_CONFIG/command" ]]; then
            COMMAND_DIR="${OPENCODE_CONFIG}/commands"
            [[ -d "$OPENCODE_CONFIG/command" ]] && COMMAND_DIR="${OPENCODE_CONFIG}/command"
            
            if [ "$(ls -A "$COMMAND_DIR" 2>/dev/null)" ]; then
                cp "$COMMAND_DIR"/*.md "$OPENAGENT_ROOT/system/opencode/commands/" 2>/dev/null || true
                echo "  ✓ Moved commands"
            fi
            rm -rf "$COMMAND_DIR"
        fi
        
        # Move skills
        if [[ -d "$OPENCODE_CONFIG/skills" ]] || [[ -d "$OPENCODE_CONFIG/skill" ]]; then
            SKILL_DIR="${OPENCODE_CONFIG}/skills"
            [[ -d "$OPENCODE_CONFIG/skill" ]] && SKILL_DIR="${OPENCODE_CONFIG}/skill"
            
            if [ "$(ls -A "$SKILL_DIR" 2>/dev/null)" ]; then
                cp -r "$SKILL_DIR"/* "$OPENAGENT_ROOT/system/skills/" 2>/dev/null || true
                echo "  ✓ Moved skills"
            fi
            rm -rf "$SKILL_DIR"
        fi
        
        # Move plugins
        if [[ -d "$OPENCODE_CONFIG/plugins" ]] || [[ -d "$OPENCODE_CONFIG/plugin" ]]; then
            PLUGIN_DIR="${OPENCODE_CONFIG}/plugins"
            [[ -d "$OPENCODE_CONFIG/plugin" ]] && PLUGIN_DIR="${OPENCODE_CONFIG}/plugin"
            
            mkdir -p "$OPENAGENT_ROOT/system/opencode/plugins"
            if [ "$(ls -A "$PLUGIN_DIR" 2>/dev/null)" ]; then
                cp -r "$PLUGIN_DIR"/* "$OPENAGENT_ROOT/system/opencode/plugins/" 2>/dev/null || true
                echo "  ✓ Moved plugins"
            fi
            rm -rf "$PLUGIN_DIR"
        fi
        
        echo ""
        echo "Now creating symlinks..."
        
        # Create symlinks (plural directories)
        ln -s "$OPENAGENT_ROOT/system/agents" "$OPENCODE_CONFIG/agents"
        ln -s "$OPENAGENT_ROOT/system/opencode/commands" "$OPENCODE_CONFIG/commands"
        ln -s "$OPENAGENT_ROOT/system/skills" "$OPENCODE_CONFIG/skills"
        ln -s "$OPENAGENT_ROOT/system/opencode/plugins" "$OPENCODE_CONFIG/plugins"
        
        echo "  ✓ Symlinked agents"
        echo "  ✓ Symlinked commands"
        echo "  ✓ Symlinked skills"
        echo "  ✓ Symlinked plugins"
        echo ""
        echo "✓ Merge complete! All files now in OpenAgent with automatic sync."
        
    fi
    
else
    # Clean install - no existing config
    echo "No existing OpenCode config found."
    echo "Creating symlinks for automatic sync..."
    echo ""
    
    mkdir -p "$OPENCODE_CONFIG"
    
    # Create symlinks (plural directories)
    ln -s "$OPENAGENT_ROOT/system/agents" "$OPENCODE_CONFIG/agents"
    ln -s "$OPENAGENT_ROOT/system/opencode/commands" "$OPENCODE_CONFIG/commands"
    ln -s "$OPENAGENT_ROOT/system/skills" "$OPENCODE_CONFIG/skills"
    ln -s "$OPENAGENT_ROOT/system/opencode/plugins" "$OPENCODE_CONFIG/plugins"
    
    echo "✓ Symlinked: agents"
    echo "✓ Symlinked: commands"
    echo "✓ Symlinked: skills"
    echo "✓ Symlinked: plugins"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Shell Alias (Optional)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "To make the 'openagent' command permanent, run ONE of these:"
echo ""
echo "For zsh (most macOS users):"
echo "  echo 'alias openagent=\"cd $OPENAGENT_ROOT && opencode --agent openagent --prompt Hello\"' >> ~/.zshrc && source ~/.zshrc"
echo ""
echo "For bash:"
echo "  echo 'alias openagent=\"cd $OPENAGENT_ROOT && opencode --agent openagent --prompt Hello\"' >> ~/.bashrc && source ~/.bashrc"
echo ""
echo "If you get API errors, add --model flag:"
echo "  alias openagent=\"cd $OPENAGENT_ROOT && opencode --agent openagent --model anthropic/claude-sonnet-4-5 --prompt Hello\""
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
