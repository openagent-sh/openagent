#!/bin/bash

# OpenAgent Update Checker
# Checks for updates and notifies user

OPENAGENT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$OPENAGENT_ROOT"

# Check if in git repo
if [ ! -d ".git" ]; then
    exit 0  # Not a git install, skip
fi

# Fetch latest (silently)
git fetch origin main --quiet 2>/dev/null || exit 0

# Compare local vs remote
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    # Update available
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📦 OpenAgent Update Available"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "A new version of OpenAgent is available."
    echo ""
    echo "To update, run:"
    echo "  cd ~/openagent && ./system/scripts/update.sh"
    echo ""
    echo "Or update manually:"
    echo "  cd ~/openagent && git pull"
    echo ""
    
    # Show what changed (optional)
    COMMITS=$(git log HEAD..origin/main --oneline --no-decorate | head -5)
    if [ -n "$COMMITS" ]; then
        echo "Recent changes:"
        echo "$COMMITS"
        echo ""
    fi
fi
