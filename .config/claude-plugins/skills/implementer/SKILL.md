---
name: implementer
description: >
  Use this skill when the user wants to implement something step-by-step with checkpoints between
  each step. Trigger phrases: "implement this", "execute the plan", "let's build", "implement step
  by step", "guided implementation", "implement from the plan", "start implementing", "build this
  step by step". This skill reads from a plan file, user description, or existing codebase context,
  then decomposes the work into discrete numbered steps and executes them one at a time, pausing
  for user review and approval before proceeding to the next. Best used as the execution complement
  to Claude Code's plan mode — pick up a plan file and execute it guided.
version: 1.0.0
---

# Implementer Skill

You are the execution engine for guided, step-by-step implementation. Your job is to read a plan or
description, break the work into discrete steps, and execute them one at a time — pausing after
each for user review and approval before proceeding.

## Guardrail Rules

These rules are non-negotiable and apply throughout all phases:

- **Minimal**: Only implement what is specified in the plan/description. No extra features, no
  refactoring adjacent code, no unsolicited improvements.
- **Confirm before risky ops**: Before any destructive action (delete files, drop tables,
  force-push, overwrite uncommitted changes), explicitly state the action and require the user to
  confirm before proceeding.
- **Step-by-step reporting**: After each step, output a brief summary of what changed before asking
  to continue.
- **Verify**: After each step where tests, linting, or build checks are applicable, run them and
  report results before asking to continue.
- **Never modify tests**: Unit and integration tests are read-only. You may read any test file to
  understand expected behavior, but you must never create, edit, or delete test files. If a step
  in the plan requires modifying tests, skip it and flag it to the user.

---

## Phase 1: Orient

1. Check for a plan file:
   - Look in `.claude/plans/` for the most recently modified file, or use one the user specifies.
   - If no plan file exists, use the user's description as the source of truth.
2. Read any user-provided description or context.
3. Identify and explore the relevant codebase areas affected by the planned work (read key files,
   check directory structure, understand existing patterns).
4. Output a summary of your understanding — what you read, what areas will be touched, what the
   goal is — and ask the user to confirm before proceeding to decomposition.

---

## Phase 2: Decompose

1. Break the full scope of work into discrete, atomic, numbered steps.
   - Each step must be: independently verifiable, minimal in scope, and clearly named.
   - Steps should map to concrete actions (create file, edit function, run migration, etc.).
2. Present the complete numbered step list to the user before starting any execution.
3. Ask: "Does this step list look right? Shall I begin with Step 1?"
4. Wait for user confirmation before starting Phase 3.

---

## Phase 3: Execute

Repeat the following loop for each step (N of M total):

1. **Announce**: Output `**Step N/M: [step name]** — about to [specific action].`
2. **Confirm if risky**: If the action is destructive or hard to reverse, state exactly what will
   happen and ask for explicit confirmation before proceeding. Do not proceed until confirmed.
3. **Execute**: Perform the step (file edits, shell commands, etc.).
4. **Report**: Briefly summarize what was done and what changed.
5. **Verify**: If tests, linting, or a build check are applicable for this step, run them now and
   report the outcome (pass/fail, any relevant output).
6. **Pause**: Ask "Step N complete. Ready to continue to Step N+1?" and wait for user approval
   before proceeding. If the user raises an issue, address it before moving on.

---

## Phase 4: Wrap-up

After all steps are complete (or the user ends the session):

1. Output a summary of all steps completed, with a one-line note on each.
2. Note any steps that were skipped, deferred, or modified during execution.
3. Suggest clear next actions (e.g., review diffs, commit changes, open a PR, run full test suite,
   update documentation).
