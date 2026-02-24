# Token Optimization

Strategies for minimizing token usage while maximizing Gemini CLI effectiveness.

## 1. Model Selection Strategy

| Task | Recommended Model | Why |
|------|-------------------|-----|
| Quick questions, formatting | `gemini-2.5-flash` | Fast, cheap, good enough |
| Complex reasoning, architecture | `gemini-2.5-pro` | Better reasoning, worth the cost |
| Code review, security audit | `gemini-2.5-pro` | Needs deep understanding |
| Simple refactoring, renaming | `gemini-2.5-flash` | Mechanical task |

Switch models mid-session:
```bash
gemini -m gemini-2.5-flash  # start with flash for exploration
# then switch to pro for the hard parts
```

## 2. System Prompt Slimming

Your GEMINI.md directly impacts token usage — it's sent with EVERY prompt.

### Do
- Keep GEMINI.md under 500 lines
- Use bullet points over prose
- Import only relevant sections with `@file.md`
- Move rarely-needed context to separate files

### Don't
- Paste entire style guides — link them
- Include examples for obvious conventions
- Repeat information already in the codebase

### Modular Context Pattern
```markdown
# GEMINI.md (slim root)
## Project: MyApp
- TypeScript, Next.js 14, Tailwind
- Testing: vitest

@./docs/api-conventions.md      # only loaded when API files touched
@./docs/database-patterns.md    # only loaded when DB files touched
```

## 3. Background Process Pattern

For long-running tasks, use headless mode to avoid paying for the interactive UI overhead:

```bash
# Non-interactive — cheaper and scriptable
gemini -p "Refactor all API handlers to use the new middleware pattern" \
  --output-format json > results.json

# Batch processing
for file in src/handlers/*.ts; do
  gemini -p "Add error handling to $(basename $file)" --output-format json
done
```

## 4. Context Window Management

- Use `/chat save` to checkpoint before context fills up
- Start new sessions for unrelated tasks
- Use `--include-directories` to limit what Gemini sees
- Remove verbose logs/output from context before asking questions

## 5. Prompt Efficiency

### Wasteful
```
Can you please look at the file src/api/handler.ts and tell me 
if there are any bugs? Also maybe suggest some improvements if 
you see any opportunities for optimization.
```

### Efficient
```
Review src/api/handler.ts: bugs, performance issues, fixes.
```

Same result, ~60% fewer tokens.
