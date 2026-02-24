# Parallelization

Run multiple Gemini CLI instances in parallel for faster development.

## When to Parallelize
- Independent code changes across different modules
- Running tests + linting + type-checking simultaneously
- Reviewing multiple files/PRs at once
- Generating docs for multiple components
- Exploring multiple solution approaches

## Pattern 1: Parallel Shell Sessions

Run multiple Gemini instances in separate terminals:
```bash
# Terminal 1: Work on frontend
cd frontend && gemini -p "Implement the login form component"

# Terminal 2: Work on backend (simultaneously)
cd backend && gemini -p "Implement the auth API endpoint"

# Terminal 3: Work on tests
cd tests && gemini -p "Write integration tests for auth flow"
```

## Pattern 2: Background Task Pipeline

Use shell backgrounding for batch operations:
```bash
#!/bin/bash
# parallel-review.sh — Review multiple files simultaneously

files=(
  "src/api/auth.ts"
  "src/api/users.ts"
  "src/api/payments.ts"
)

for file in "${files[@]}"; do
  gemini -p "Review $file for bugs and security issues" \
    --output-format json > "reviews/$(basename $file .ts).json" &
done

wait
echo "All reviews complete"
```

## Pattern 3: Fan-Out / Fan-In

Split a large task, process in parallel, merge results:
```bash
# Fan out: Generate implementations
gemini -p "Implement UserService" --output-format json > user.json &
gemini -p "Implement PaymentService" --output-format json > payment.json &
gemini -p "Implement NotificationService" --output-format json > notif.json &
wait

# Fan in: Integration review
gemini -p "Review the integration between these three services: 
$(cat user.json payment.json notif.json)"
```

## Pattern 4: Speculative Execution

Explore multiple approaches simultaneously, pick the best:
```bash
# Approach A: Event-driven
gemini -p "Design auth system using event-driven architecture" \
  --output-format json > approach-a.json &

# Approach B: Request-response
gemini -p "Design auth system using request-response pattern" \
  --output-format json > approach-b.json &

wait

# Compare
gemini -p "Compare these two architecture approaches and recommend one:
Approach A: $(cat approach-a.json)
Approach B: $(cat approach-b.json)"
```

## Pattern 5: Continuous Background Verification

Run verification in a background loop while you work:
```bash
#!/bin/bash
# watch-verify.sh — Continuous verification in background
while true; do
  inotifywait -r -e modify src/
  echo "Changes detected, running verification..."
  npx tsc --noEmit 2>&1 | tail -5
  npx vitest run --reporter=dot 2>&1 | tail -3
done
```

## Tips
- Each Gemini instance has its own context — don't expect shared state
- Use file-based communication (JSON files) between parallel instances
- Set `--output-format json` for machine-readable output
- Use `xargs -P` for simple parallelization over lists
- Limit parallelism to avoid API rate limits (3-5 concurrent is safe)
