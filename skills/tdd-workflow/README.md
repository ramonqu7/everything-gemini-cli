# TDD Workflow

Test-Driven Development methodology for Gemini CLI.

## Red-Green-Refactor Cycle
1. **Red**: Write a test that fails
2. **Green**: Write minimum code to pass
3. **Refactor**: Clean up while keeping tests green

## Usage
Use the `/tdd` command to start a TDD session:
```
/tdd "UserService.createUser should validate email format"
```

## Tips
- One test at a time
- Don't write production code without a failing test
- Refactor only when tests are green
- Keep tests fast (< 100ms each)
