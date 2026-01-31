#!/bin/bash

# OpenAgent OpenCode Sync Script
# Syncs system/agents/ and system/opencode/ to ~/.config/opencode/

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Paths
OPENAGENT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OPENCODE_CONFIG="$HOME/.config/opencode"

# Dry run flag
DRY_RUN=false
DIRECTION="to-opencode"

# Help
show_help() {
  echo "OpenAgent OpenCode Sync Script"
  echo ""
  echo "Usage: $0 [options] [direction]"
  echo ""
  echo "Directions:"
  echo "  to-opencode   Sync FROM openagent TO ~/.config/opencode (default)"
  echo "  to-openagent  Sync FROM ~/.config/opencode TO openagent"
  echo ""
  echo "Options:"
  echo "  --dry-run    Show what would be synced without making changes"
  echo "  --agents      Sync agents only"
  echo "  --commands    Sync commands only"
  echo "  --plugins     Sync plugins only"
  echo ""
  echo "Examples:"
  echo "  $0                          # Sync all to opencode"
  echo "  $0 --dry-run               # Preview sync"
  echo "  $0 to-openagent --agents    # Sync agents to openagent"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --agents)
      SYNC_AGENTS=true
      shift
      ;;
    --commands)
      SYNC_COMMANDS=true
      shift
      ;;
    --plugins)
      SYNC_PLUGINS=true
      shift
      ;;
    --skills)
      SYNC_SKILLS=true
      shift
      ;;
    to-opencode|to-openagent)
      DIRECTION="$1"
      shift
      ;;
    --help|-h)
      show_help
      exit 0
      ;;
    *)
      echo -e "${RED}Unknown option: $1${NC}"
      show_help
      exit 1
      ;;
  esac
done

# If no specific type selected, sync all
if [[ -z "$SYNC_AGENTS" && -z "$SYNC_COMMANDS" && -z "$SYNC_PLUGINS" && -z "$SYNC_SKILLS" ]]; then
  SYNC_AGENTS=true
  SYNC_COMMANDS=true
  SYNC_PLUGINS=true
  SYNC_SKILLS=true
fi

# Set source and target based on direction
if [[ "$DIRECTION" == "to-opencode" ]]; then
  AGENTS_SRC="$OPENAGENT_ROOT/system/agents"
  AGENTS_DST="$OPENCODE_CONFIG/agent"
  COMMANDS_SRC="$OPENAGENT_ROOT/system/opencode/commands"
  COMMANDS_DST="$OPENCODE_CONFIG/command"
  PLUGINS_SRC="$OPENAGENT_ROOT/system/opencode/plugins"
  PLUGINS_DST="$OPENCODE_CONFIG/plugin"
  SKILLS_SRC="$OPENAGENT_ROOT/system/skills"
  SKILLS_DST="$OPENCODE_CONFIG/skill"  # Note: OpenCode uses singular 'skill'
  DIRECTION_DESC="openagent → ~/.config/opencode"
else
  AGENTS_SRC="$OPENCODE_CONFIG/agent"
  AGENTS_DST="$OPENAGENT_ROOT/system/agents"
  COMMANDS_SRC="$OPENCODE_CONFIG/command"
  COMMANDS_DST="$OPENAGENT_ROOT/system/opencode/commands"
  PLUGINS_SRC="$OPENCODE_CONFIG/plugin"
  PLUGINS_DST="$OPENAGENT_ROOT/system/opencode/plugins"
  SKILLS_SRC="$OPENCODE_CONFIG/skill"
  SKILLS_DST="$OPENAGENT_ROOT/system/skills"
  DIRECTION_DESC="~/.config/opencode → openagent"
fi

# Log function
log() {
  local level="$1"
  shift
  local msg="$*"
  local color

  case "$level" in
    INFO) color="$BLUE" ;;
    SUCCESS) color="$GREEN" ;;
    WARN) color="$YELLOW" ;;
    ERROR) color="$RED" ;;
  esac

  echo -e "${color}[$level]${NC} $msg"
}

# Sync function
sync_dir() {
  local src="$1"
  local dst="$2"
  local name="$3"

  if [[ ! -d "$src" ]]; then
    log WARN "Skipping $name: source directory not found: $src"
    return
  fi

  log INFO "Syncing $name: $DIRECTION_DESC"

  if [[ "$DRY_RUN" == true ]]; then
    echo "Would sync: $src → $dst"
    return
  fi

  # Create destination if needed
  mkdir -p "$dst"

  # Copy files
  if [[ "$name" == "agents" ]]; then
    # Agents are flat - copy all *.md files
    find "$src" -name "*.md" -exec cp {} "$dst/" \;
  else
    # Regular sync
    rsync -av "$src/" "$dst/"
  fi

  log SUCCESS "Synced $name"
}

# Sync agents
if [[ "$SYNC_AGENTS" == true ]]; then
  sync_dir "$AGENTS_SRC" "$AGENTS_DST" "agents"
fi

# Sync commands
if [[ "$SYNC_COMMANDS" == true ]]; then
  sync_dir "$COMMANDS_SRC" "$COMMANDS_DST" "commands"
fi

# Sync plugins
if [[ "$SYNC_PLUGINS" == true ]]; then
  sync_dir "$PLUGINS_SRC" "$PLUGINS_DST" "plugins"
fi

# Sync skills
if [[ "$SYNC_SKILLS" == true ]]; then
  sync_dir "$SKILLS_SRC" "$SKILLS_DST" "skills"
fi

# Sync skills
if [[ "$SYNC_SKILLS" == true ]]; then
  sync_dir "$SKILLS_SRC" "$SKILLS_DST" "skills"
fi

# Summary
if [[ "$DRY_RUN" == true ]]; then
  log INFO "Dry run complete. No changes made."
else
  log SUCCESS "Sync complete: $DIRECTION_DESC"
  log INFO "OpenCode will need to be restarted to reload agents/commands"
fi
