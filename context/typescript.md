# Project Context: TypeScript

## General Instructions
- Use TypeScript strict mode. No `any` types unless absolutely necessary.
- Prefer `const` over `let`. Never use `var`.
- Use functional patterns where appropriate (map, filter, reduce over for loops).
- All public functions and classes must have JSDoc comments.
- Error handling: use typed errors, never catch-and-ignore.

## Coding Style
- 2-space indentation (or match existing project config)
- No semicolons (or match existing — be consistent)
- Prefer template literals over string concatenation
- Destructure objects and arrays when it improves readability
- Use `async/await` over `.then()` chains

## Testing
- Use the project's existing test framework (vitest, jest, etc.)
- Test files: `*.test.ts` or `*.spec.ts` next to source files
- One describe block per module, nested describes for methods
- Test behavior, not implementation

## File Organization
- One export per file for major components/classes
- Group related utilities in barrel files (index.ts)
- Keep files under 300 lines — split if larger

## Common Patterns
- Use Zod for runtime validation at system boundaries
- Prefer composition over inheritance
- Use discriminated unions over type assertions
