#!/bin/bash

# OpenAgent → OpenCode Sync (Manual Tool)
#
# This script is OPTIONAL and only needed if you're NOT using symlinks.
# If setup.sh created symlinks, changes sync automatically - no need to run this.
#
# Use this script if:
# - You chose "Keep Separate" during setup
# - You want to manually push OpenAgent changes to .config/opencode
# - Symlinks were removed for some reason

set -e

OPENAGENT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OPENCODE_CONFIG="$HOME/.config/opencode"

# Check if using symlinks
if [ -L "$OPENCODE_CONFIG/agents" ]; then
  echo "⚠️  You're using symlinks - changes sync automatically."
  echo "   No need to run this script."
  exit 0
fi

echo "Syncing: openagent → ~/.config/opencode"

# Create dirs if needed (use plural as per OpenCode docs)
mkdir -p "$OPENCODE_CONFIG/agents"
mkdir -p "$OPENCODE_CONFIG/commands"
mkdir -p "$OPENCODE_CONFIG/plugins"
mkdir -p "$OPENCODE_CONFIG/skills"

# Sync agents
if [ -d "$OPENAGENT_ROOT/system/agents" ]; then
  cp "$OPENAGENT_ROOT/system/agents"/*.md "$OPENCODE_CONFIG/agents/" 2>/dev/null || true
  echo "✓ Synced agents"
fi

# Sync commands
if [ -d "$OPENAGENT_ROOT/system/opencode/commands" ]; then
  cp "$OPENAGENT_ROOT/system/opencode/commands"/*.md "$OPENCODE_CONFIG/commands/" 2>/dev/null || true
  echo "✓ Synced commands"
fi

# Sync plugins (if any)
if [ -d "$OPENAGENT_ROOT/system/opencode/plugins" ] && [ "$(ls -A "$OPENAGENT_ROOT/system/opencode/plugins" 2>/dev/null)" ]; then
  cp -r "$OPENAGENT_ROOT/system/opencode/plugins"/* "$OPENCODE_CONFIG/plugins/" 2>/dev/null || true
  echo "✓ Synced plugins"
fi

# Sync skills
if [ -d "$OPENAGENT_ROOT/system/skills" ] && [ "$(ls -A "$OPENAGENT_ROOT/system/skills" 2>/dev/null)" ]; then
  cp -r "$OPENAGENT_ROOT/system/skills"/* "$OPENCODE_CONFIG/skills/" 2>/dev/null || true
  echo "✓ Synced skills"
fi

echo ""
echo "✓ Sync complete. Restart OpenCode to see changes."
