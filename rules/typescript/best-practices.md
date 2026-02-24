# TypeScript Best Practices

1. Enable strict mode in tsconfig.json
2. Avoid `any` — use `unknown` for truly unknown types
3. Use discriminated unions over type assertions
4. Prefer `interface` for object shapes, `type` for unions/intersections
5. Use `readonly` for immutable data
6. Validate at boundaries (API inputs) with Zod or similar
7. Use `satisfies` for type-safe object literals
8. Prefer `Map`/`Set` over plain objects for dynamic keys
9. Use `const` assertions for literal types
10. Handle Promise rejections — no floating promises
