# Sub-Agents

Delegate specialized tasks to focused sub-agents within Gemini CLI.

## What Are Sub-Agents?
Sub-agents are specialized prompts that Gemini CLI can invoke for focused tasks.
Each agent has a narrow scope, specific expertise, and clear output format.
They're defined as markdown files and referenced with `@agents/name.md`.

## Architecture

```
┌─────────────────────────────────────────┐
│            Main Session                  │
│  (You, talking to Gemini CLI)           │
│                                          │
│  "Plan and implement user auth"         │
│        │                                 │
│        ├──→ @agents/planner.md          │
│        │    └── Returns: Implementation │
│        │        plan with steps          │
│        │                                 │
│        ├──→ @agents/architect.md        │
│        │    └── Returns: Architecture   │
│        │        decision with tradeoffs  │
│        │                                 │
│        ├──→ @agents/tdd-guide.md        │
│        │    └── Returns: Test + impl    │
│        │        in Red-Green-Refactor    │
│        │                                 │
│        └──→ @agents/code-reviewer.md    │
│             └── Returns: Review with    │
│                 issues and suggestions   │
└─────────────────────────────────────────┘
```

## Usage Patterns

### 1. Sequential Pipeline
Use agents in order for a complete workflow:
```
1. /plan "Add OAuth login"           → Implementation plan
2. (implement based on plan)
3. /review                           → Code review
4. /security                         → Security audit
5. /git:commit                       → Commit message
6. /git:pr                           → PR description
```

### 2. Specialized Delegation
Invoke specific agents for specific needs:
```
@agents/planner.md — when starting a new feature
@agents/architect.md — when making design decisions
@agents/tdd-guide.md — when writing tests first
@agents/code-reviewer.md — when reviewing changes
@agents/security-reviewer.md — when auditing security
@agents/build-fixer.md — when build is broken
@agents/refactor.md — when cleaning up code
@agents/doc-writer.md — when writing documentation
@agents/debugger.md — when hunting bugs
@agents/devops.md — when setting up CI/CD
@agents/cpp-reviewer.md — when reviewing C++ (Google style)
@agents/cpp-build-fixer.md — when Bazel build fails
```

### 3. Multi-Agent Review
Get multiple perspectives on the same change:
```
Review this PR from three angles:

1. As @agents/code-reviewer.md — quality and patterns
2. As @agents/security-reviewer.md — security implications
3. As @agents/cpp-reviewer.md — C++ specific issues (if applicable)

Synthesize findings into a single prioritized list.
```

### 4. Agent Chains in Commands
Create compound commands that chain agents:
```toml
# commands/full-review.toml
description = "Complete review: code quality + security + performance"
prompt = """
Perform a comprehensive review of the current changes.

Step 1 — Code Quality (as @agents/code-reviewer.md):
Review the diff for bugs, patterns, and maintainability.

Step 2 — Security (as @agents/security-reviewer.md):
Check for vulnerabilities, injection risks, auth issues.

Step 3 — Performance:
Identify N+1 queries, unnecessary allocations, missing caching.

Provide a unified report with all findings prioritized by severity.

!{git diff}
"""
```

## Creating Custom Agents

### Template
```markdown
# [Agent Name]

You are a [role description].

## Responsibilities
- What this agent does
- What it focuses on

## Process
1. Step one
2. Step two
3. Step three

## Output Format
[Exact format the agent should follow]

## Rules
- Constraint 1
- Constraint 2
```

### Tips
- Keep agents focused — one job per agent
- Define clear output formats — makes results actionable
- Include "Rules" to prevent common mistakes
- Reference other agents when collaboration is needed
- Test agents on real tasks before committing
