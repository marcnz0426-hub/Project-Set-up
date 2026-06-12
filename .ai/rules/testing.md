# Testing Rules

## Core Principle

Use test-driven development (TDD) when practical. Write the failing test first, verify it fails for the expected reason, then implement the fix.

## Rules

1. **Use TDD for features and bugfixes** when practical. Write the failing test before the implementation.
2. **Verify failing tests fail for the expected reason** before fixing. A test that passes for the wrong reason is worse than no test.
3. **Run the smallest meaningful verification first.** Don't run the full suite when a targeted test covers the change.
4. **Expand verification** when the change touches shared behavior, user-facing workflows, or critical paths.
5. **Record exact commands and results** in `PROJECT_STATUS.md`.

## Coverage Guidelines

- **Don't chase 100% coverage.** Focus on critical paths, edge cases, and error handling.
- **Cover the "happy path" plus the 3 most likely failure modes** for any feature.
- **Integration tests > unit tests** for user-facing workflows. Unit tests > integration tests for utility logic.

## Test Framework Expectations

- Use whatever test framework the project already uses. Don't introduce new ones without asking.
- If no test framework exists, recommend one during Planning (Phase 02) before Coding (Phase 07).
- Follow existing test file naming and organization patterns in the codebase.

## Mocking Boundaries

- **Mock external I/O:** network calls, file system, databases, time APIs.
- **Don't mock internal logic** unless it has side effects (database writes, API calls).
- **Don't mock the system under test.** If you're testing a function, don't mock that function.

## What to Test

- Every feature gets at least one test covering the primary use case.
- Every bugfix gets a regression test that would have caught the bug.
- Edge cases: empty inputs, null values, boundary conditions, error paths.
- Skip: trivial getters/setters, pure formatting, framework-internal behavior.

## Reference Example

An example test file lives at `tests/example.test.js`. It demonstrates:
- Test file naming and location convention
- Basic test structure (describe/it blocks)
- Edge case coverage (normal case, negative, zero)
- Assertion style

Replace this file with your project's actual tests and framework.

## When Tests Can't Run

If the project has no test runner or tests can't execute:
- Document why in `PROJECT_STATUS.md`
- Perform manual verification with explicit steps and expected vs actual results
- Recommend test setup during the current or next phase
