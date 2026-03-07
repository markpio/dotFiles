---
name: test-developer
description: >
  Use this skill when the user wants to write unit or integration tests for existing code. Trigger
  phrases: "write tests", "add tests", "test this", "cover this with tests", "write unit tests",
  "write integration tests", "add test coverage", "test the interface", "write tests for this
  module". This skill reads production source files to understand the public interface, then writes
  comprehensive tests covering happy paths, bad parameters, edge cases, and integration scenarios.
  Tests are derived from the interface only — never from internal implementation details. Production
  source files are strictly read-only.
version: 1.0.0
---

## Phase 1: Orient

1. Identify the target module(s) to test from the user's input or by exploring the codebase.
2. Read production source files to extract the public interface: exported functions, classes, methods, their signatures, parameter types, return types, and documented constraints. Read only — do not modify.
3. Identify the existing test framework and conventions (test runner, assertion library, file naming, directory layout) by reading existing test files if present.
4. Summarize the discovered interface and test setup to the user before proceeding.

## Phase 2: Plan Tests

For each public function, method, or endpoint, enumerate test cases across four categories:

1. **Happy path** — valid inputs, expected outputs
2. **Bad parameters** — null/undefined, wrong types, missing required args, extra args
3. **Boundary/edge cases** — empty collections, zero values, max values, empty strings
4. **Integration** — interactions between components, side effects, state changes

Present the complete test plan (grouped by unit under test) to the user. Ask for confirmation before writing any test code.

## Phase 3: Write Tests

- Write tests one unit at a time, grouping related tests in a describe/suite block.
- Follow the project's existing test framework, naming conventions, and file layout exactly.
- After writing each group, run the tests and report results (pass/fail, error output).
- Pause for user approval before moving to the next unit.

## Phase 4: Wrap-up

- Summarize all test suites written and counts of test cases per category.
- Note any interface aspects that could not be fully tested (e.g. private internals, external dependencies).
- Suggest next actions (e.g. add mocks for dependencies, increase coverage, integrate into CI).

---

## Guardrail Rules

- **Interface-only**: Derive all tests from the public interface (signatures, documented behavior, return types). Never test or depend on internal implementation details.
- **Never modify production code**: Production source files are read-only. Do not create, edit, or delete any non-test source file. If a gap in testability requires a production change, flag it to the user instead.
- **Bad parameter coverage is mandatory**: Every function/method must have at least one test for invalid or unexpected input.
- **Match project conventions**: Use the existing test framework, file structure, and naming conventions. Do not introduce new testing libraries unless the project has none and the user approves.
