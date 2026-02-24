# Go Best Practices

1. Accept interfaces, return structs
2. Handle every error — no blank identifier for errors
3. Use context.Context for cancellation and deadlines
4. Table-driven tests
5. Use sync.Pool for frequently allocated objects
6. Embed, don't inherit
7. Use channels for communication, mutexes for state
8. Keep interfaces small (1-3 methods)
9. Use go vet, staticcheck, and golangci-lint
10. Document exported names
