# Project Context: C++ (Google Style)

## General Instructions
- Follow the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html).
- Use C++17 or later unless the project requires otherwise.
- All code must pass clang-tidy and clang-format checks.
- Use Abseil (absl) libraries where available over std equivalents.

## Build System
- Use Bazel for building and testing.
- BUILD files should be well-organized with clear visibility rules.
- Prefer `cc_library`, `cc_test`, `cc_binary` targets.
- Keep BUILD files close to the source they describe.
- Use `deps` carefully — minimize transitive dependencies.

## Naming Conventions (Google Style)
- **Files**: `my_class.h`, `my_class.cc`, `my_class_test.cc`
- **Classes/Structs**: `PascalCase` — `MyClass`, `HttpRequest`
- **Functions**: `PascalCase` — `ComputeResult()`, `GetName()`
- **Variables**: `snake_case` — `my_variable`, `table_name`
- **Member variables**: trailing underscore — `member_var_`
- **Constants**: `k` prefix + PascalCase — `kMaxRetries`, `kDefaultTimeout`
- **Enums**: `PascalCase` for type, `k` prefix for values — `enum class Color { kRed, kGreen }`
- **Namespaces**: `snake_case` — `my_project::util`
- **Macros**: `ALL_CAPS` — `MY_MACRO` (avoid macros when possible)

## Header Files
- Use `#pragma once` or include guards (`#ifndef PROJECT_PATH_FILE_H_`)
- Forward-declare when possible to reduce includes
- Include order (separated by blank lines):
  1. Related header (the `.h` for this `.cc`)
  2. C system headers
  3. C++ standard library headers
  4. Other library headers (Abseil, Protobuf, etc.)
  5. Project headers

## Error Handling
- Use `absl::Status` and `absl::StatusOr<T>` for fallible operations.
- Use `RETURN_IF_ERROR()` and `ASSIGN_OR_RETURN()` macros.
- Never throw exceptions (Google style prohibits them).
- Use `LOG(ERROR)` / `LOG(WARNING)` / `LOG(INFO)` for logging.
- Use `CHECK()` / `DCHECK()` for invariants and assertions.

## Memory & Ownership
- Use `std::unique_ptr` for single ownership.
- Use `std::shared_ptr` sparingly — prefer unique_ptr.
- Raw pointers are non-owning observers only.
- Use `absl::string_view` instead of `const std::string&` for read-only strings.
- Avoid manual `new`/`delete` — use smart pointers or arena allocation.

## Concurrency
- Use `absl::Mutex` over `std::mutex`.
- Annotate with `ABSL_GUARDED_BY()` and `ABSL_LOCKS_EXCLUDED()`.
- Prefer `absl::MutexLock` for RAII locking.
- Use thread annotations for static analysis.

## Protobuf
- Use proto3 syntax for new protos.
- Follow proto style guide (lowercase_underscore for fields).
- Use `arena` allocation for performance-critical proto operations.
- Prefer `proto.has_field()` over checking default values.

## Testing
- Use GoogleTest (gtest) framework.
- Test files: `*_test.cc` alongside source files.
- Use `TEST()` for simple tests, `TEST_F()` with fixtures for shared setup.
- Use `EXPECT_*` (non-fatal) over `ASSERT_*` (fatal) unless subsequent tests depend on it.
- Use `EXPECT_THAT()` with matchers for readable assertions.
- Use `MockFunction` and gmock for mocking.
- Benchmark with `benchmark::State` for performance-critical code.

## Code Review (Google-style)
- Every CL (changelist) should be reviewable in ~15 minutes.
- One logical change per CL.
- CL description format: first line is summary, body explains why.
- Respond to all review comments.
- LGTM means "Looks Good To Me" — code is ready to submit.

## Common Patterns
- RAII for resource management.
- Factory functions over constructors for complex initialization.
- `StatusOr<T>` for error propagation (no exceptions).
- Builder pattern for complex object construction.
- Use `absl::flat_hash_map` / `absl::flat_hash_set` over `std::unordered_*`.
- Use `absl::StrCat()` / `absl::StrFormat()` over string concatenation.
- Use `absl::Duration` / `absl::Time` for time handling.
