# Continuous Learning

Auto-extract reusable patterns from coding sessions.

## How It Works
1. After solving a non-trivial problem, use `/learn:extract`
2. Gemini analyzes the session and identifies reusable patterns
3. Patterns are saved to `learnings/` directory as markdown files
4. Import learnings into GEMINI.md with `@learnings/`

## Pattern Format
```markdown
# Pattern: [Name]
## When to Use
[Conditions that make this pattern applicable]
## Implementation
[Code example or steps]
## Caveats
[Things to watch out for]
```
