# React Best Practices

1. Functional components only — no class components
2. Custom hooks for reusable logic
3. Keys should be stable and unique (not array index)
4. Avoid prop drilling — use composition or context
5. Memoize only when profiling shows it helps
6. Use ErrorBoundary for graceful error handling
7. Accessible by default — semantic HTML, ARIA labels
8. Server components first (Next.js) — client only when needed
9. Colocate state as close to where it's used as possible
10. Suspense for loading states, error boundaries for errors
