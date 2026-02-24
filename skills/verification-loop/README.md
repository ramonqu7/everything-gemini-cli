# Verification Loop

Continuous testing and validation during development.

## Process
1. Before any code change, run existing tests
2. Make the change
3. Run tests again immediately
4. If tests fail, fix before proceeding
5. Add new tests for new behavior

## Integration
Add to your GEMINI.md:
```markdown
## Verification Rules
- Run tests after every code change
- Never commit code that doesn't pass tests
- Add tests for every new function
- Check for type errors before committing
```
