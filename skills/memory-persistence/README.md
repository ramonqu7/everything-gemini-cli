# Memory Persistence

Cross-session memory for Gemini CLI — never lose context again.

## The Problem
Gemini CLI sessions are ephemeral. When you close the terminal, context is gone.

## Solution: Three-Layer Memory

### Layer 1: GEMINI.md (Always Loaded)
Your project's persistent memory. Updated automatically or manually.

```markdown
# GEMINI.md
## Project State
- Current sprint: Authentication refactor
- Blocked on: OAuth provider migration (waiting for API keys)
- Last session: Fixed token refresh logic in auth.ts

## Decisions Made
- 2026-02-20: Use Zod for API validation (over io-ts)
- 2026-02-19: Switch from REST to tRPC for internal APIs

## Known Issues
- Race condition in session cleanup (low priority)
- Memory leak in WebSocket handler under load
```

### Layer 2: Checkpoints (Session Snapshots)
Save complex sessions to resume later:
```bash
/chat save my-refactoring-session
# ... days later ...
/chat load my-refactoring-session
```

### Layer 3: Memory Command (Quick Notes)
Add quick persistent notes during a session:
```bash
/memory add "Auth module uses JWT with 15min expiry, refresh tokens in httpOnly cookies"
```

## Auto-Memory Pattern

Add this to your GEMINI.md to trigger auto-saving:
```markdown
## Session End Protocol
Before ending any session:
1. Summarize key decisions made → append to ## Decisions Made
2. List unfinished work → update ## Project State
3. Note any discovered issues → add to ## Known Issues
4. Update ## Last Session with today's date and summary
```

## Memory File Structure
```
project/
├── GEMINI.md              # Active context (always loaded)
├── .gemini/
│   ├── decisions.md       # Architectural Decision Records
│   ├── learnings.md       # Extracted patterns
│   └── session-notes/     # Per-session summaries
│       ├── 2026-02-20.md
│       └── 2026-02-21.md
```

## Import Pattern for Modular Memory
```markdown
# GEMINI.md
@.gemini/decisions.md
@.gemini/learnings.md
```
Only import what's relevant — keep the root GEMINI.md slim.
