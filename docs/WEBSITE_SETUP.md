# Website Setup Guide for open-agent.sh/install

## What You Need to Do

### 1. Host the install.sh script

You need to serve the `install.sh` file at:
```
https://open-agent.sh/install
```

**Requirements:**
- Must return `Content-Type: text/plain` or `application/x-sh`
- Must be the raw script content (not HTML)
- Should be the exact content from `/install.sh` in this repo

### 2. Implementation Options

#### Option A: Static File Hosting
If your site is static (Vercel, Netlify, etc.):

```
public/
  install          <- Copy install.sh here (no .sh extension)
```

Set header in your config:
- Vercel: `vercel.json`
- Netlify: `_headers` file

#### Option B: API Route
If you have a backend:

```javascript
// pages/api/install.js (Next.js example)
import fs from 'fs'
import path from 'path'

export default function handler(req, res) {
  const script = fs.readFileSync(
    path.join(process.cwd(), 'install.sh'), 
    'utf8'
  )
  
  res.setHeader('Content-Type', 'text/plain')
  res.status(200).send(script)
}
```

#### Option C: Redirect to GitHub (Quick Test)
For testing, you can redirect to GitHub raw:

```
https://open-agent.sh/install 
  → redirects to →
https://raw.githubusercontent.com/openagent-sh/openagent/main/install.sh
```

But this means the script lives in GitHub, not your website.

### 3. Test It

```bash
# Should show the script content
curl -fsSL https://open-agent.sh/install

# Should install OpenAgent
curl -fsSL https://open-agent.sh/install | bash
```

### 4. Update Website Copy

Add this to your homepage:

```bash
curl -fsSL https://open-agent.sh/install | bash
```

## Recommended: Keep Script in Sync

The `install.sh` in this repo should be the source of truth.

**On every release:**
1. Update `install.sh` in repo
2. Deploy to website automatically

Or use GitHub raw URL approach (Option C) so it's always in sync.

## Example: Vercel Setup

If your site is on Vercel:

```json
// vercel.json
{
  "headers": [
    {
      "source": "/install",
      "headers": [
        {
          "key": "Content-Type",
          "value": "text/plain"
        }
      ]
    }
  ]
}
```

Then just put `install.sh` in `public/install` (no extension).

## Testing on Fresh macOS

Before deploying, test locally:

```bash
# Serve the script locally
cd openagent
python3 -m http.server 8000

# In another terminal, test install
curl -fsSL http://localhost:8000/install.sh | bash
```

This simulates what users will run.
