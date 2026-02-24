# Memory Persistence

Patterns for maintaining context across Gemini CLI sessions.

## Strategy
1. Use GEMINI.md as persistent memory — add key decisions and learnings
2. Use `/memory add` to append critical context during sessions
3. Use checkpointing (`/chat save`) before ending complex sessions
4. Maintain a `DECISIONS.md` file for architectural decisions

## Auto-Memory Pattern
At the end of each significant session, ask Gemini to:
1. Summarize key decisions made
2. List any unfinished work
3. Note any patterns discovered
4. Append to GEMINI.md or a dedicated memory file
