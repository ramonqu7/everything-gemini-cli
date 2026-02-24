# Verification Loop

Continuous testing and validation — catch errors before they compound.

## Core Principle
Every code change must be verified IMMEDIATELY. Don't batch changes and test at the end.

## The Loop

```
┌──────────────┐
│  Read & Plan │
└──────┬───────┘
       ▼
┌──────────────┐
│ Run Tests    │ ← Before ANY change (establish baseline)
└──────┬───────┘
       ▼
┌──────────────┐
│ Make Change  │ ← ONE minimal change
└──────┬───────┘
       ▼
┌──────────────┐
│ Verify       │ ← Run tests + type check + lint
└──────┬───────┘
       │
  Pass? ─── No ──→ Fix immediately (don't proceed)
       │
      Yes
       │
       ▼
┌──────────────┐
│ Next Change  │
└──────────────┘
```

## Verification Commands by Language

### TypeScript
```bash
npx tsc --noEmit && npx vitest run --reporter=verbose
```

### Python
```bash
mypy . && python -m pytest -v
```

### Go
```bash
go vet ./... && go test ./...
```

### C++ (Bazel)
```bash
bazel build //... && bazel test //...
```

## GEMINI.md Integration
Add this to enforce the loop automatically:
```markdown
## Verification Protocol
After EVERY code change:
1. Run type checker / compiler
2. Run affected tests
3. If either fails, fix before proceeding
4. Never skip verification — even for "obvious" changes
5. If you're about to say "this should work" — verify it does
```

## Anti-Patterns to Avoid
- ❌ "I'll test it all at the end" — errors compound
- ❌ "This change is too small to break anything" — it isn't
- ❌ "The types will catch it" — runtime behavior ≠ type correctness
- ❌ Skipping tests because they're slow — make them faster instead

## Checkpoint Strategy
Create verification checkpoints at stable states:
```bash
# After each verified change, commit
git add -A && git commit -m "verified: [description]"
# If something breaks later, easy to bisect
```
