# 🚀 Everything Gemini CLI

> The complete Gemini CLI configuration collection — agents, commands, GEMINI.md context files, rules, and skills for production-grade development workflows.

Inspired by [everything-claude-code](https://github.com/affaan-m/everything-claude-code), adapted for [Gemini CLI](https://github.com/google-gemini/gemini-cli).

## ✨ What's Included

| Component | Count | Description |
|-----------|-------|-------------|
| 🤖 Agents | 12 | Specialized sub-agents for planning, review, TDD, security, C++ |
| ⚡ Commands | 25+ | Custom slash commands (`.toml` format) |
| 📝 GEMINI.md | 9 | Context files for different project types (incl. C++ Google Style) |
| 🔧 Skills | 7 | Token optimization, memory persistence, parallelization, sub-agents |
| 📏 Rules | 6 | Language-specific coding standards (incl. C++ Google Style) |

## 🏗️ Installation

```bash
# Clone
git clone https://github.com/ramonqu7/everything-gemini-cli.git
cd everything-gemini-cli

# Install globally (copies to ~/.gemini/)
./install.sh

# Or install for a specific project
./install.sh --project /path/to/your/project
```

## 📁 Structure

```
everything-gemini-cli/
├── agents/                        # Sub-agent definitions
│   ├── planner.md                # Feature planning & architecture
│   ├── architect.md              # System design decisions
│   ├── tdd-guide.md              # Test-driven development guide
│   ├── code-reviewer.md          # Code quality & patterns
│   ├── security-reviewer.md      # Security vulnerability analysis
│   ├── build-fixer.md            # Build error resolution
│   ├── refactor.md               # Refactoring & cleanup
│   ├── doc-writer.md             # Documentation generation
│   ├── debugger.md               # Debugging assistant
│   ├── devops.md                 # CI/CD & deployment
│   ├── cpp-reviewer.md           # C++ Google Style reviewer
│   └── cpp-build-fixer.md        # C++ Bazel build fixer
│
├── commands/                      # Custom slash commands (.toml)
│   ├── plan.toml                 # /plan - Implementation planning
│   ├── tdd.toml                  # /tdd - Test-driven development
│   ├── review.toml               # /review - Code review
│   ├── full-review.toml          # /full-review - Quality + Security + Performance
│   ├── fix.toml                  # /fix - Fix build errors
│   ├── refactor.toml             # /refactor - Code cleanup
│   ├── security.toml             # /security - Security audit
│   ├── test.toml                 # /test - Run & analyze tests
│   ├── doc.toml                  # /doc - Generate docs
│   ├── explain.toml              # /explain - Explain code
│   ├── optimize.toml             # /optimize - Performance optimization
│   ├── debug.toml                # /debug - Systematic debugging
│   ├── decide.toml               # /decide - Architecture decisions
│   ├── migrate.toml              # /migrate - Database migrations
│   ├── api.toml                  # /api - API design helper
│   ├── deploy.toml               # /deploy - Deployment checklist
│   ├── changelog.toml            # /changelog - Update changelog
│   ├── cpp-review.toml           # /cpp-review - C++ Google Style review
│   ├── cpp-fix.toml              # /cpp-fix - C++ Bazel build fix
│   ├── git/
│   │   ├── commit.toml           # /git:commit - Smart commit messages
│   │   ├── pr.toml               # /git:pr - PR description
│   │   └── rebase.toml           # /git:rebase - Interactive rebase help
│   └── learn/
│       ├── extract.toml          # /learn:extract - Extract patterns
│       └── review.toml           # /learn:review - Review learnings
│
├── context/                       # GEMINI.md templates
│   ├── typescript.md             # TypeScript/Node.js projects
│   ├── python.md                 # Python projects
│   ├── golang.md                 # Go projects
│   ├── cpp-google.md             # C++ (Google Style + Bazel + Abseil)
│   ├── react.md                  # React/Next.js frontend
│   ├── fullstack.md              # Full-stack applications
│   ├── monorepo.md               # Monorepo with turborepo/nx
│   ├── ml-project.md             # ML/AI projects
│   └── general.md                # General purpose
│
├── rules/                         # Coding standards
│   ├── common/                   # Language-agnostic rules
│   ├── typescript/                # TypeScript best practices
│   ├── python/                   # Python best practices
│   ├── golang/                   # Go best practices
│   ├── react/                    # React patterns
│   └── cpp-google/               # C++ Google Style (15 rules)
│
├── skills/                        # Advanced development skills
│   ├── token-optimization/        # ⚡ Minimize token usage & costs
│   ├── memory-persistence/        # 🧠 Cross-session memory (3 layers)
│   ├── continuous-learning/       # 📚 Auto-extract reusable patterns
│   ├── verification-loop/         # ✅ Continuous test-verify cycle
│   ├── parallelization/           # 🔀 Multi-instance parallel workflows
│   ├── subagents/                 # 🤖 Agent delegation & orchestration
│   └── tdd-workflow/              # 🧪 TDD methodology
│
├── install.sh                     # Installation script
├── LICENSE                        # MIT
└── README.md
```

## 🤖 Agents

Each agent is a focused sub-agent prompt. Reference them in your GEMINI.md with `@agents/planner.md`.

| Agent | Purpose |
|-------|---------|
| `planner` | Break down features into implementation steps |
| `architect` | Make system design decisions with tradeoff analysis |
| `tdd-guide` | Guide test-driven development workflow |
| `code-reviewer` | Review code for quality, patterns, and bugs |
| `security-reviewer` | Find security vulnerabilities |
| `build-fixer` | Diagnose and fix build/compile errors |
| `refactor` | Identify and execute safe refactoring |
| `doc-writer` | Generate and maintain documentation |
| `debugger` | Systematic debugging and root cause analysis |
| `devops` | CI/CD pipelines, Docker, deployment |
| `cpp-reviewer` | C++ code review (Google Style Guide) |
| `cpp-build-fixer` | C++ / Bazel build error diagnosis |

## ⚡ Commands

### Core
```bash
/plan "Add user authentication with OAuth"    # Plan implementation
/tdd "UserService.createUser method"          # TDD workflow
/review                                        # Review current changes
/full-review                                   # Quality + Security + Performance
/fix                                           # Fix build errors
/security                                      # Security audit
/test                                          # Run & analyze tests
/debug "Login fails after token refresh"       # Systematic debugging
/decide "SQL vs NoSQL for user sessions"       # Architecture decision
/explain src/core/engine.ts                    # Explain code
/optimize src/api/handler.ts                   # Performance tips
```

### C++ (Google Style)
```bash
/cpp-review                     # Review C++ for Google Style compliance
/cpp-fix                        # Fix C++ / Bazel build errors
```

### Git
```bash
/git:commit                     # Generate smart commit message
/git:pr                         # Generate PR description
/git:rebase main                # Help with interactive rebase
```

### Learning
```bash
/learn:extract                  # Extract patterns from session
/learn:review                   # Review accumulated learnings
```

## 🧠 Skills (Advanced)

### ⚡ Token Optimization
Strategies to minimize token usage:
- Model selection (flash vs pro) based on task complexity
- System prompt slimming techniques
- Background processing patterns
- Prompt efficiency guidelines

### 🧠 Memory Persistence
Three-layer cross-session memory:
1. **GEMINI.md** — Always-loaded project context
2. **Checkpoints** — Session snapshots (`/chat save/load`)
3. **Memory command** — Quick persistent notes (`/memory add`)

### 📚 Continuous Learning
Auto-extract reusable patterns from coding sessions:
- Pattern / Anti-pattern capture
- Debugging tricks library
- Project-specific conventions
- Performance insights

### ✅ Verification Loop
Continuous test-verify cycle after every code change:
- Compiler/type-checker → Tests → Lint
- Never batch changes without verification
- Checkpoint strategy for easy bisection

### 🔀 Parallelization
Multi-instance parallel workflows:
- Parallel shell sessions for independent modules
- Background task pipelines for batch operations
- Fan-out/fan-in for complex tasks
- Speculative execution for exploring approaches

### 🤖 Sub-Agents
Agent delegation and orchestration:
- Sequential pipelines (plan → implement → review → ship)
- Multi-agent review (quality + security + performance)
- Agent chains in custom commands
- Custom agent creation guide

### 🧪 TDD Workflow
Red-Green-Refactor methodology with Gemini CLI integration.

## 📝 GEMINI.md Context Files

Pre-built context files for different project types:

```bash
cp context/typescript.md ~/my-project/GEMINI.md    # TypeScript
cp context/python.md ~/my-project/GEMINI.md        # Python
cp context/golang.md ~/my-project/GEMINI.md        # Go
cp context/cpp-google.md ~/my-project/GEMINI.md    # C++ (Google Style)
cp context/react.md ~/my-project/GEMINI.md         # React/Next.js
cp context/fullstack.md ~/my-project/GEMINI.md     # Full-stack
cp context/monorepo.md ~/my-project/GEMINI.md      # Monorepo
cp context/ml-project.md ~/my-project/GEMINI.md    # ML/AI
cp context/general.md ~/my-project/GEMINI.md       # General
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing`)
3. Commit your changes (`git commit -m 'feat: add amazing thing'`)
4. Push (`git push origin feature/amazing`)
5. Open a Pull Request

### What to Contribute
- **Commands**: `.toml` files in `commands/`
- **Agents**: `.md` files in `agents/`
- **Context**: `.md` files in `context/`
- **Rules**: Add to `rules/` subdirectory
- **Skills**: Create a directory in `skills/`

## 📄 License

MIT — see [LICENSE](LICENSE)

## 🙏 Credits

- Inspired by [everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- Built for [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- C++ Style: [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
