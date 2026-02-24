# Project Context: Monorepo

## General Instructions
- Respect package boundaries — don't import from other packages' internals
- Use workspace dependencies (workspace:*) for local packages
- Share configuration through the tooling/ directory
- Changes should be scoped to the minimum number of packages

## Build System
- Use the project's build tool (turbo, nx, etc.)
- Run only affected tests/builds when possible
- Understand the dependency graph before making changes

## Common Packages
- Check if shared utilities already exist before creating new ones
- New shared code goes in packages/, not duplicated across apps

## CI/CD
- Each package should be independently buildable and testable
- Use caching for faster CI runs
