#!/bin/bash

# OpenAgent Installer
# Installs OpenAgent to ~/openagent and runs setup

set -e

echo "╔════════════════════════════════════════╗"
echo "║   OpenAgent Installer                  ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed."
    echo "   Install it first: https://git-scm.com"
    exit 1
fi

# Check if OpenCode is installed
if ! command -v opencode &> /dev/null; then
    echo "❌ OpenCode is not installed."
    echo "   Install it first: https://opencode.ai"
    exit 1
fi

echo "✓ Git detected"
echo "✓ OpenCode detected"
echo ""

# Determine install location
INSTALL_DIR="$HOME/openagent"

# Check if already exists
if [ -d "$INSTALL_DIR" ]; then
    echo "⚠️  OpenAgent already exists at: $INSTALL_DIR"
    echo ""
    echo -n "Reinstall? This will backup the existing directory. [y/N]: "
    read -r CONFIRM
    
    if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    # Backup existing installation
    BACKUP_DIR="${INSTALL_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up to: $BACKUP_DIR"
    mv "$INSTALL_DIR" "$BACKUP_DIR"
fi

# Clone the repository
echo "Downloading OpenAgent..."
git clone https://github.com/openagent-sh/openagent.git "$INSTALL_DIR"

echo ""
echo "✓ OpenAgent downloaded to: $INSTALL_DIR"
echo ""

# Run setup
cd "$INSTALL_DIR"
echo "Starting setup..."
echo ""
./system/scripts/setup.sh

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Installation Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "  1. (Optional) Add the shell alias shown above"
echo "  2. Run: opencode"
echo "  3. Type: /onboarding"
echo ""
echo "Need help? https://open-agent.sh/docs"
