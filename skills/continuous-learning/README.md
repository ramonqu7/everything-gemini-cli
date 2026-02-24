# Continuous Learning

Automatically extract and accumulate reusable patterns from your coding sessions.

## Why
Every debugging session, code review, and architecture discussion generates insights.
Without capturing them, you solve the same problems repeatedly.

## Workflow

### 1. During Session — Capture
When you solve a non-trivial problem, use:
```bash
/learn:extract
```
Gemini analyzes the conversation and extracts patterns into structured learnings.

### 2. After Session — Review
Periodically review accumulated learnings:
```bash
/learn:review
```
This consolidates, deduplicates, and prunes outdated patterns.

### 3. Automatic — Integration
Add learnings to your GEMINI.md so they're always available:
```markdown
# GEMINI.md
@.gemini/learnings.md
```

## Learning File Format
```markdown
# Learnings

## Pattern: Retry with Exponential Backoff
**When**: Any external API call that might fail transiently
**Why**: Learned during Stripe integration — intermittent 502s caused payment failures
**Implementation**:
```typescript
async function withRetry<T>(fn: () => Promise<T>, maxRetries = 3): Promise<T> {
  for (let i = 0; i < maxRetries; i++) {
    try { return await fn(); }
    catch (e) {
      if (i === maxRetries - 1) throw e;
      await sleep(Math.pow(2, i) * 1000);
    }
  }
  throw new Error("unreachable");
}
```
**Caveats**: Don't retry non-idempotent operations without dedup keys

## Anti-Pattern: Catch-All Error Handler
**When**: Tempted to add `catch(e) { log(e) }` to "fix" errors
**Why**: Hid a data corruption bug for 3 weeks in the user service
**Instead**: Let errors propagate, handle them at the boundary
```

## Categories to Track
1. **Patterns** — Reusable solutions that worked well
2. **Anti-Patterns** — Mistakes to avoid (with context on WHY)
3. **Project-Specific** — Conventions unique to this codebase
4. **Debugging Tricks** — Techniques that saved time
5. **Performance** — Optimization insights with benchmarks
