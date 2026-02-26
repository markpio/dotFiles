# Scaffold Role-Based Planning Agents

Set up multi-agent planning roles for this project. Each role has strict file ownership and information barriers.

## Instructions

You are scaffolding role-based planning agents for the current project. Follow these steps precisely:

### Step 1: Read the Constitution

Read the reference docs:
- `~/.claude/docs/role-based-planning.md` (constitution — roles, info flow, constraints)
- `~/.claude/docs/role-matrix.md` (access control matrix with glob patterns)

### Step 2: Inspect Project Structure

Analyze the current project to determine:
- Language/framework (C++, Python, Go, JS/TS, Rust, etc.)
- Directory layout (where source, tests, docs, UI, build files live)
- Build system (CMake, Make, npm, cargo, etc.)
- Whether there's a UI component (CLI, web, or none)

### Step 3: Ask User Which Roles to Include

Present the 7 roles and ask which to scaffold. Not all projects need all roles:

| Role | Agent | When to include |
|---|---|---|
| Architect | `plan-architect` | Always recommended — orchestrates everything |
| Backend | `plan-backend` | Any project with source code |
| UI | `plan-ui` | Projects with CLI interface or web frontend |
| Tester | `plan-tester` | Projects with a test suite |
| Docs | `plan-docs` | Projects needing documentation |
| Build | `plan-build` | Projects with non-trivial build configs |
| Git | `plan-git` | Projects needing coordinated branching, commits, or releases |

### Step 4: Customize Glob Patterns

Map the role-matrix.md glob patterns to the actual project layout. For example:
- A Go project: backend WRITE = `cmd/**`, `internal/**`, `pkg/**`
- A Python project: backend WRITE = `src/**`, `lib/**`; tester WRITE = `tests/**`, `*_test.py`
- A web project: UI WRITE = `src/components/**`, `src/pages/**`, `public/**`
- Git role: WRITE = `.gitignore`, `.gitattributes`, `CHANGELOG.md`, `VERSION`, `.version`, `release-notes/**`

### Step 5: Scaffold Agent Files

Create `.claude/agents/plan-<role>.md` for each selected role. Use this template:

```markdown
---
name: plan-<role>
description: "<one-line role description>"
color: <color>
---

# Plan <Role> Agent

You are the **<role>** agent in a role-based planning system.

## Identity

**Role**: <Role>
**Responsibility**: <description from constitution>

## Access Control

### WRITE (you own these files)
<customized glob list>

### READ-ONLY (you may read but NEVER modify)
<customized glob list>

### NO ACCESS (you must NEVER read or write)
<customized glob list>

## Boundary Rules

- MUST only create/modify files in your WRITE zone
- MUST request delegation for changes outside your WRITE zone
- MUST annotate shared file changes: `SHARED FILE CHANGE (<role>): <description>`
- NEVER write to files in your NO ACCESS zone
- NEVER read files in your NO ACCESS zone
<role-specific MUST/NEVER rules>

## Workflow

1. <role-specific workflow steps>

## Quality Checklist

- [ ] All changes within WRITE zone
- [ ] No boundary violations
- [ ] Delegation requests created for cross-boundary needs
- [ ] Shared file changes annotated
<role-specific checklist items>
```

### Step 6: Update Project CLAUDE.md

Add a `## Planning Roles` section to the project's `.claude/CLAUDE.md`:

```markdown
## Planning Roles

Multi-agent planning with role-based access control. See [constitution](~/.claude/docs/role-based-planning.md).

| Role | Agent | Owns |
|---|---|---|
| Architect | `plan-architect` | Design artifacts, API specs |
| Backend | `plan-backend` | <customized> |
...
```

### Step 7: Summary

Report what was created:
- List of scaffolded agent files
- Customized glob patterns per role
- Any notes about project-specific adaptations
