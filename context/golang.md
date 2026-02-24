# Project Context: Go

## General Instructions
- Follow Go conventions: effective Go, Go proverbs.
- Use the standard library whenever possible.
- Handle every error — never use `_` for errors.
- Keep functions short and focused.

## Coding Style
- Use gofmt/goimports formatting (non-negotiable)
- Exported names should have doc comments
- Group imports: stdlib, external, internal
- Prefer table-driven tests
- Use interfaces for abstraction, not inheritance

## Testing
- Test files: `*_test.go` in same package
- Use `testing.T` for unit tests, `testing.B` for benchmarks
- Use testify/assert for readable assertions if the project uses it
- Test the public API, not internal functions

## Error Handling
- Return errors, don't panic
- Wrap errors with context: `fmt.Errorf("doing X: %w", err)`
- Use sentinel errors for expected conditions
- Use custom error types for errors that need extra context
