Browser Automation with agent-browser
Quick start
agent-browser open <url>        # Navigate to page
agent-browser snapshot -i       # Get interactive elements with refs
agent-browser click @e1         # Click element by ref
agent-browser fill @e2 "text"   # Fill input by ref
agent-browser close             # Close browser
Core workflow
Navigate: agent-browser open <url>
Snapshot: agent-browser snapshot -i (returns elements with refs like @e1, @e2)
Interact using refs from the snapshot
Re-snapshot after navigation or significant DOM changes
Commands
Navigation
agent-browser open <url>      # Navigate to URL (aliases: goto, navigate)
                              # Supports: https://, http://, file://, about:, data://
                              # Auto-prepends https:// if no protocol given
agent-browser back            # Go back
agent-browser forward         # Go forward
agent-browser reload          # Reload page
agent-browser close           # Close browser (aliases: quit, exit)
agent-browser connect 9222    # Connect to browser via CDP port
Snapshot (page analysis)
agent-browser snapshot            # Full accessibility tree
agent-browser snapshot -i         # Interactive elements only (recommended)
agent-browser snapshot -c         # Compact output
agent-browser snapshot -d 3       # Limit depth to 3
agent-browser snapshot -s "#main" # Scope to CSS selector
Interactions (use @refs from snapshot)
agent-browser click @e1           # Click
agent-browser dblclick @e1        # Double-click
agent-browser focus @e1           # Focus element
agent-browser fill @e2 "text"     # Clear and type
agent-browser type @e2 "text"     # Type without clearing
agent-browser press Enter         # Press key (alias: key)
agent-browser press Control+a     # Key combination
agent-browser keydown Shift       # Hold key down
agent-browser keyup Shift         # Release key
agent-browser hover @e1           # Hover
agent-browser check @e1           # Check checkbox
agent-browser uncheck @e1         # Uncheck checkbox
agent-browser select @e1 "value"  # Select dropdown option
agent-browser select @e1 "a" "b"  # Select multiple options
agent-browser scroll down 500     # Scroll page (default: down 300px)
agent-browser scrollintoview @e1  # Scroll element into view (alias: scrollinto)
agent-browser drag @e1 @e2        # Drag and drop
agent-browser upload @e1 file.pdf # Upload files
Get information
agent-browser get text @e1        # Get element text
agent-browser get html @e1        # Get innerHTML
agent-browser get value @e1       # Get input value
agent-browser get attr @e1 href   # Get attribute
agent-browser get title           # Get page title
agent-browser get url             # Get current URL
agent-browser get count ".item"   # Count matching elements
agent-browser get box @e1         # Get bounding box
agent-browser get styles @e1      # Get computed styles (font, color, bg, etc.)
Check state
agent-browser is visible @e1      # Check if visible
agent-browser is enabled @e1      # Check if enabled
agent-browser is checked @e1      # Check if checked
Screenshots & PDF
agent-browser screenshot          # Screenshot to stdout
agent-browser screenshot path.png # Save to file
agent-browser screenshot --full   # Full page
agent-browser pdf output.pdf      # Save as PDF
Video recording
agent-browser record start ./demo.webm    # Start recording (uses current URL + state)
agent-browser click @e1                   # Perform actions
agent-browser record stop                 # Stop and save video
agent-browser record restart ./take2.webm # Stop current + start new recording
Recording creates a fresh context but preserves cookies/storage from your session. If no URL is provided, it automatically returns to your current page. For smooth demos, explore first, then start recording.

Wait
agent-browser wait @e1                     # Wait for element
agent-browser wait 2000                    # Wait milliseconds
agent-browser wait --text "Success"        # Wait for text (or -t)
agent-browser wait --url "**/dashboard"    # Wait for URL pattern (or -u)
agent-browser wait --load networkidle      # Wait for network idle (or -l)
agent-browser wait --fn "window.ready"     # Wait for JS condition (or -f)
Mouse control
agent-browser mouse move 100 200      # Move mouse
agent-browser mouse down left         # Press button
agent-browser mouse up left           # Release button
agent-browser mouse wheel 100         # Scroll wheel
Semantic locators (alternative to refs)
agent-browser find role button click --name "Submit"
agent-browser find text "Sign In" click
agent-browser find text "Sign In" click --exact      # Exact match only
agent-browser find label "Email" fill "user@test.com"
agent-browser find placeholder "Search" type "query"
agent-browser find alt "Logo" click
agent-browser find title "Close" click
agent-browser find testid "submit-btn" click
agent-browser find first ".item" click
agent-browser find last ".item" click
agent-browser find nth 2 "a" hover
Browser settings
agent-browser set viewport 1920 1080          # Set viewport size
agent-browser set device "iPhone 14"          # Emulate device
agent-browser set geo 37.7749 -122.4194       # Set geolocation (alias: geolocation)
agent-browser set offline on                  # Toggle offline mode
agent-browser set headers '{"X-Key":"v"}'     # Extra HTTP headers
agent-browser set credentials user pass       # HTTP basic auth (alias: auth)
agent-browser set media dark                  # Emulate color scheme
agent-browser set media light reduced-motion  # Light mode + reduced motion
Cookies & Storage
agent-browser cookies                     # Get all cookies
agent-browser cookies set name value      # Set cookie
agent-browser cookies clear               # Clear cookies
agent-browser storage local               # Get all localStorage
agent-browser storage local key           # Get specific key
agent-browser storage local set k v       # Set value
agent-browser storage local clear         # Clear all
Network
agent-browser network route <url>              # Intercept requests
agent-browser network route <url> --abort      # Block requests
agent-browser network route <url> --body '{}'  # Mock response
agent-browser network unroute [url]            # Remove routes
agent-browser network requests                 # View tracked requests
agent-browser network requests --filter api    # Filter requests
Tabs & Windows
agent-browser tab                 # List tabs
agent-browser tab new [url]       # New tab
agent-browser tab 2               # Switch to tab by index
agent-browser tab close           # Close current tab
agent-browser tab close 2         # Close tab by index
agent-browser window new          # New window
Frames
agent-browser frame "#iframe"     # Switch to iframe
agent-browser frame main          # Back to main frame
Dialogs
agent-browser dialog accept [text]  # Accept dialog
agent-browser dialog dismiss        # Dismiss dialog
JavaScript
agent-browser eval "document.title"   # Run JavaScript
Global options
agent-browser --session <name> ...    # Isolated browser session
agent-browser --json ...              # JSON output for parsing
agent-browser --headed ...            # Show browser window (not headless)
agent-browser --full ...              # Full page screenshot (-f)
agent-browser --cdp <port> ...        # Connect via Chrome DevTools Protocol
agent-browser --proxy <url> ...       # Use proxy server
agent-browser --headers <json> ...    # HTTP headers scoped to URL's origin
agent-browser --executable-path <p>   # Custom browser executable
agent-browser --extension <path> ...  # Load browser extension (repeatable)
agent-browser --help                  # Show help (-h)
agent-browser --version               # Show version (-V)
agent-browser <command> --help        # Show detailed help for a command
Proxy support
agent-browser --proxy http://proxy.com:8080 open example.com
agent-browser --proxy http://user:pass@proxy.com:8080 open example.com
agent-browser --proxy socks5://proxy.com:1080 open example.com
Environment variables
AGENT_BROWSER_SESSION="mysession"            # Default session name
AGENT_BROWSER_EXECUTABLE_PATH="/path/chrome" # Custom browser path
AGENT_BROWSER_EXTENSIONS="/ext1,/ext2"       # Comma-separated extension paths
AGENT_BROWSER_STREAM_PORT="9223"             # WebSocket streaming port
AGENT_BROWSER_HOME="/path/to/agent-browser"  # Custom install location (for daemon.js)
Example: Form submission
agent-browser open https://example.com/form
agent-browser snapshot -i
# Output shows: textbox "Email" [ref=e1], textbox "Password" [ref=e2], button "Submit" [ref=e3]

agent-browser fill @e1 "user@example.com"
agent-browser fill @e2 "password123"
agent-browser click @e3
agent-browser wait --load networkidle
agent-browser snapshot -i  # Check result
Example: Authentication with saved state
# Login once
agent-browser open https://app.example.com/login
agent-browser snapshot -i
agent-browser fill @e1 "username"
agent-browser fill @e2 "password"
agent-browser click @e3
agent-browser wait --url "**/dashboard"
agent-browser state save auth.json

# Later sessions: load saved state
agent-browser state load auth.json
agent-browser open https://app.example.com/dashboard
Sessions (parallel browsers)
agent-browser --session test1 open site-a.com
agent-browser --session test2 open site-b.com
agent-browser session list
JSON output (for parsing)
Add --json for machine-readable output:

agent-browser snapshot -i --json
agent-browser get text @e1 --json
Debugging
agent-browser --headed open example.com   # Show browser window
agent-browser --cdp 9222 snapshot         # Connect via CDP port
agent-browser connect 9222                # Alternative: connect command
agent-browser console                     # View console messages
agent-browser console --clear             # Clear console
agent-browser errors                      # View page errors
agent-browser errors --clear              # Clear errors
agent-browser highlight @e1               # Highlight element
agent-browser trace start                 # Start recording trace
agent-browser trace stop trace.zip        # Stop and save trace
agent-browser record start ./debug.webm   # Record video from current page
agent-browser record stop                 # Save recording
Deep-dive documentation
For detailed patterns and best practices, see:

Reference	Description
references/snapshot-refs.md	Ref lifecycle, invalidation rules, troubleshooting
references/session-management.md	Parallel sessions, state persistence, concurrent scraping
references/authentication.md	Login flows, OAuth, 2FA handling, state reuse
references/video-recording.md	Recording workflows for debugging and documentation
references/proxy-support.md	Proxy configuration, geo-testing, rotating proxies
Ready-to-use templates
Executable workflow scripts for common patterns:

Template	Description
templates/form-automation.sh	Form filling with validation
templates/authenticated-session.sh	Login once, reuse state
templates/capture-workflow.sh	Content extraction with screenshots
Usage:

./templates/form-automation.sh https://example.com/form
./templates/authenticated-session.sh https://app.example.com/login
./templates/capture-workflow.sh https://example.com ./output

#!/bin/bash
# Template: Content Capture Workflow
# Extract content from web pages with optional authentication

set -euo pipefail

TARGET_URL="${1:?Usage: $0 <url> [output-dir]}"
OUTPUT_DIR="${2:-.}"

echo "Capturing content from: $TARGET_URL"
mkdir -p "$OUTPUT_DIR"

# Optional: Load authentication state if needed
# if [[ -f "./auth-state.json" ]]; then
#     agent-browser state load "./auth-state.json"
# fi

# Navigate to target page
agent-browser open "$TARGET_URL"
agent-browser wait --load networkidle

# Get page metadata
echo "Page title: $(agent-browser get title)"
echo "Page URL: $(agent-browser get url)"

# Capture full page screenshot
agent-browser screenshot --full "$OUTPUT_DIR/page-full.png"
echo "Screenshot saved: $OUTPUT_DIR/page-full.png"

# Get page structure
agent-browser snapshot -i > "$OUTPUT_DIR/page-structure.txt"
echo "Structure saved: $OUTPUT_DIR/page-structure.txt"

# Extract main content
# Adjust selector based on target site structure
# agent-browser get text @e1 > "$OUTPUT_DIR/main-content.txt"

# Extract specific elements (uncomment as needed)
# agent-browser get text "article" > "$OUTPUT_DIR/article.txt"
# agent-browser get text "main" > "$OUTPUT_DIR/main.txt"
# agent-browser get text ".content" > "$OUTPUT_DIR/content.txt"

# Get full page text
agent-browser get text body > "$OUTPUT_DIR/page-text.txt"
echo "Text content saved: $OUTPUT_DIR/page-text.txt"

# Optional: Save as PDF
agent-browser pdf "$OUTPUT_DIR/page.pdf"
echo "PDF saved: $OUTPUT_DIR/page.pdf"

# Optional: Capture with scrolling for infinite scroll pages
# scroll_and_capture() {
#     local count=0
#     while [[ $count -lt 5 ]]; do
#         agent-browser scroll down 1000
#         agent-browser wait 1000
#         ((count++))
#     done
#     agent-browser screenshot --full "$OUTPUT_DIR/page-scrolled.png"
# }
# scroll_and_capture

# Cleanup
agent-browser close

echo ""
echo "Capture complete! Files saved to: $OUTPUT_DIR"
ls -la "$OUTPUT_DIR"
