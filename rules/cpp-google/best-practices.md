# C++ Best Practices (Google Style)

1. **No exceptions** — use `absl::Status` / `absl::StatusOr<T>` for error handling
2. **RAII everywhere** — smart pointers, lock guards, scoped cleanup
3. **Forward declare** — reduce header dependencies, speed up builds
4. **Prefer Abseil** — `absl::flat_hash_map`, `absl::StrCat`, `absl::Duration` over std
5. **Thread safety annotations** — `ABSL_GUARDED_BY`, `ABSL_LOCKS_EXCLUDED` on all shared state
6. **No raw new/delete** — use `std::make_unique`, `std::make_shared`, or arena
7. **string_view for params** — `absl::string_view` over `const std::string&`
8. **Minimize includes** — one class per header, forward declare in headers
9. **Const correctness** — mark everything const that can be const
10. **Small CLs** — one logical change, reviewable in 15 minutes
11. **Test alongside code** — `foo_test.cc` next to `foo.cc`
12. **Use matchers** — `EXPECT_THAT(x, ElementsAre(...))` over manual loops
13. **Proto best practices** — `has_field()` checks, arena for perf, proto3
14. **Bazel deps** — minimize visibility, explicit deps, no circular
15. **Logging** — `LOG(INFO/WARNING/ERROR)`, never `std::cout` in production
