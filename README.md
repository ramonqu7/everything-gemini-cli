# 🚀 Everything Gemini CLI

> The complete Gemini CLI configuration collection — agents, commands, GEMINI.md context files, and MCP configs for production-grade development workflows.

Inspired by [everything-claude-code](https://github.com/affaan-m/everything-claude-code), adapted for [Gemini CLI](https://github.com/google-gemini/gemini-cli).

## ✨ What's Included

| Component | Count | Description |
|-----------|-------|-------------|
| 🤖 Agents | 10 | Specialized sub-agents for planning, review, TDD, security |
| ⚡ Commands | 20+ | Custom slash commands (`.toml` format) |
| 📝 GEMINI.md | 8 | Context files for different project types |
| 🔧 MCP Configs | 3 | Pre-configured MCP server setups |
| 📏 Rules | 5 | Language-specific coding standards |

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
├── agents/                    # Sub-agent definitions
│   ├── planner.md            # Feature planning & architecture
│   ├── architect.md          # System design decisions
│   ├── tdd-guide.md          # Test-driven development guide
│   ├── code-reviewer.md      # Code quality & patterns
│   ├── security-reviewer.md  # Security vulnerability analysis
│   ├── build-fixer.md        # Build error resolution
│   ├── refactor.md           # Refactoring & cleanup
│   ├── doc-writer.md         # Documentation generation
│   ├── debugger.md           # Debugging assistant
│   └── devops.md             # CI/CD & deployment
│
├── commands/                  # Custom slash commands (.toml)
│   ├── plan.toml             # /plan - Implementation planning
│   ├── tdd.toml              # /tdd - Test-driven development
│   ├── review.toml           # /review - Code review
│   ├── fix.toml              # /fix - Fix build errors
│   ├── refactor.toml         # /refactor - Code cleanup
│   ├── security.toml         # /security - Security audit
│   ├── test.toml             # /test - Run & analyze tests
│   ├── doc.toml              # /doc - Generate docs
│   ├── explain.toml          # /explain - Explain code
│   ├── optimize.toml         # /optimize - Performance optimization
│   ├── migrate.toml          # /migrate - Database migrations
│   ├── api.toml              # /api - API design helper
│   ├── deploy.toml           # /deploy - Deployment checklist
│   ├── changelog.toml        # /changelog - Update changelog
│   ├── git/
│   │   ├── commit.toml       # /git:commit - Smart commit messages
│   │   ├── pr.toml           # /git:pr - PR description
│   │   └── rebase.toml       # /git:rebase - Interactive rebase help
│   └── learn/
│       ├── extract.toml      # /learn:extract - Extract patterns
│       └── review.toml       # /learn:review - Review learnings
│
├── context/                   # GEMINI.md templates
│   ├── typescript.md         # TypeScript/Node.js projects
│   ├── python.md             # Python projects
│   ├── golang.md             # Go projects
│   ├── react.md              # React/Next.js frontend
│   ├── fullstack.md          # Full-stack applications
│   ├── monorepo.md           # Monorepo with turborepo/nx
│   ├── ml-project.md         # ML/AI projects
│   └── general.md            # General purpose
│
├── mcp/                       # MCP server configurations
│   ├── filesystem.json       # Enhanced filesystem tools
│   ├── github.json           # GitHub integration
│   └── database.json         # Database tools
│
├── rules/                     # Coding standards
│   ├── common/               # Language-agnostic rules
│   ├── typescript/            # TypeScript best practices
│   ├── python/               # Python best practices
│   ├── golang/               # Go best practices
│   └── react/                # React patterns
│
├── skills/                    # Reusable skill definitions
│   ├── continuous-learning/   # Auto-extract patterns
│   ├── verification-loop/     # Continuous verification
│   ├── tdd-workflow/          # TDD methodology
│   └── memory-persistence/    # Cross-session memory
│
├── install.sh                 # Installation script
└── README.md
```

## 🤖 Agents

Each agent is a focused sub-agent prompt that Gemini CLI can delegate to. Reference them in your GEMINI.md with `@agents/planner.md`.

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

## ⚡ Commands

Custom slash commands in TOML format. Drop them in `~/.gemini/commands/` or `<project>/.gemini/commands/`.

### Core Commands

```bash
/plan "Add user authentication with OAuth"    # Plan implementation
/tdd "UserService.createUser method"          # TDD workflow
/review                                        # Review current changes
/fix                                           # Fix build errors
/security                                      # Security audit
/test                                          # Run & analyze tests
/explain src/core/engine.ts                    # Explain code
/optimize src/api/handler.ts                   # Performance tips
```

### Git Commands

```bash
/git:commit                     # Generate smart commit message
/git:pr                         # Generate PR description
/git:rebase main                # Help with interactive rebase
```

### Learning Commands

```bash
/learn:extract                  # Extract patterns from session
/learn:review                   # Review accumulated learnings
```

## 📝 GEMINI.md Context Files

Pre-built context files for different project types. Copy the one that matches your stack to your project root as `GEMINI.md`.

```bash
# For a TypeScript project
cp context/typescript.md ~/my-project/GEMINI.md

# For a Python project
cp context/python.md ~/my-project/GEMINI.md
```

Each context file includes:
- Project type detection
- Coding style guidelines
- Testing conventions
- Error handling patterns
- Common pitfalls to avoid

## 🔑 Key Concepts

### Memory Persistence
The `skills/memory-persistence/` directory contains patterns for maintaining context across Gemini CLI sessions using checkpoint files and GEMINI.md updates.

### Continuous Learning
`skills/continuous-learning/` defines how to auto-extract useful patterns from your coding sessions and save them as reusable knowledge.

### Verification Loops
`skills/verification-loop/` implements continuous testing and validation during development — catch issues before they compound.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Contribution Types

- **New commands**: Add `.toml` files to `commands/`
- **New agents**: Add `.md` files to `agents/`
- **New context files**: Add `.md` files to `context/`
- **New rules**: Add to appropriate `rules/` subdirectory
- **New skills**: Create a directory in `skills/`

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Credits

- Inspired by [everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- Built for [Gemini CLI](https://github.com/google-gemini/gemini-cli)
