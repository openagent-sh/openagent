#!/bin/bash

# OpenAgent Updater
# Safely updates OpenAgent while preserving user data

set -e

OPENAGENT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$OPENAGENT_ROOT"

echo "╔════════════════════════════════════════╗"
echo "║   OpenAgent Updater                    ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if in git repo
if [ ! -d ".git" ]; then
    echo "❌ Not a git installation. Cannot auto-update."
    echo ""
    echo "If you installed via curl | bash, this should work."
    echo "If you're missing .git, reinstall:"
    echo "  cd ~ && curl -fsSL https://open-agent.sh/install | bash"
    exit 1
fi

# Check for uncommitted changes in user files
USER_FILES="AGENT.md system/memory/ tasks/ workspaces/"
CHANGES=$(git status --porcelain $USER_FILES 2>/dev/null)

if [ -n "$CHANGES" ]; then
    echo "⚠️  You have uncommitted changes in:"
    echo "$CHANGES"
    echo ""
    echo "These are YOUR files and will be preserved."
    echo ""
fi

# Show what will be updated
echo "Checking for updates..."
git fetch origin main --quiet

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "✓ Already up to date!"
    exit 0
fi

echo ""
echo "📦 New version available!"
echo ""
echo "Changes:"
git log HEAD..origin/main --oneline --no-decorate | head -10
echo ""

echo -n "Update now? [y/N]: "
read -r CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Update cancelled."
    exit 0
fi

echo ""
echo "Updating..."

# Stash user changes
if [ -n "$CHANGES" ]; then
    echo "Stashing your changes..."
    git stash push -m "Auto-stash before update $(date +%Y-%m-%d_%H:%M:%S)" $USER_FILES
    STASHED=true
fi

# Pull updates
git pull origin main

# Restore user changes
if [ "$STASHED" = true ]; then
    echo "Restoring your changes..."
    git stash pop || {
        echo ""
        echo "⚠️  Stash conflict detected."
        echo "Your changes are in: git stash list"
        echo "Manually resolve with: git stash pop"
    }
fi

echo ""
echo "✓ Update complete!"
echo ""
echo "Restart OpenCode to see changes."
