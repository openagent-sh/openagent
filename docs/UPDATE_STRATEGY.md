# OpenAgent Update Strategy

## How Users Get Updates

### Automatic Update Check (Implemented)

**When:** Every time user runs `/openagent`

**How it works:**
1. `check-update.sh` runs silently in background
2. Compares local git HEAD with origin/main
3. If update available, shows notification with:
   - Version info
   - Recent changes
   - Update command

**User sees:**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 OpenAgent Update Available
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

A new version of OpenAgent is available.

To update, run:
  cd ~/openagent && ./system/scripts/update.sh

Recent changes:
- Fix memory format issue
- Add new capture features
- Improve onboarding flow
```

### Easy Update Process

**User runs:**
```bash
cd ~/openagent
./system/scripts/update.sh
```

**Script does:**
1. Checks for uncommitted changes in user files (AGENT.md, memory/, tasks/, workspaces/)
2. Shows what will change
3. Asks for confirmation
4. Stashes user changes (safe)
5. Pulls updates
6. Restores user changes
7. Handles conflicts gracefully

**User data is ALWAYS preserved** - update.sh only touches OpenAgent system files.

## Alternative Update Methods

### 1. Manual Git Pull (Advanced Users)
```bash
cd ~/openagent
git pull
```

Works, but no safety checks for user data.

### 2. Reinstall (Nuclear Option)
```bash
curl -fsSL https://open-agent.sh/install | bash
```

Backs up existing installation, fresh install.

## Notification Channels

### Built-in (Implemented)
- ✅ Check on every `/openagent` launch
- ✅ Shows recent changes
- ✅ One-command update

### Optional (Future)
- GitHub Releases with RSS feed
- Email newsletter for major updates
- Discord/Slack community announcements
- `@openagent_` Twitter updates

## Update Frequency Recommendation

**For you (maintainer):**
- Batch small fixes weekly
- Release immediately for critical bugs
- Major features monthly
- Use semantic versioning tags

**For users:**
- Update check is automatic
- They update when convenient
- No forced updates
- User data always safe

## Version Tracking

Consider adding version to `SOUL.md`:

```markdown
# SOUL - The Constitution of OpenAgent

**Version:** 0.2.0
**Last Updated:** 2026-02-01
```

Then `check-update.sh` can show version numbers:
```
Update available: v0.1.0 → v0.2.0
```

## Testing Updates

Before releasing updates:

1. **Test update.sh locally:**
```bash
# Make local changes to AGENT.md
# Then pull updates
./system/scripts/update.sh
# Verify your changes preserved
```

2. **Test on fresh install:**
```bash
# Install old version
curl -fsSL https://open-agent.sh/install | bash
# Then update
cd ~/openagent
./system/scripts/update.sh
```

3. **Test notification:**
```bash
# Run check manually
./system/scripts/check-update.sh
```

## Files Modified

Created:
- `system/scripts/check-update.sh` - Background update checker
- `system/scripts/update.sh` - Safe updater with user data protection

Modified:
- `system/agents/openagent.md` - Runs check-update.sh on launch

## User Education

Add to README:

### Staying Updated

OpenAgent automatically checks for updates when you run `/openagent`. 

When an update is available, you'll see:
```
📦 OpenAgent Update Available
```

To update:
```bash
cd ~/openagent
./system/scripts/update.sh
```

Your personal data (AGENT.md, memory, tasks) is always preserved.
