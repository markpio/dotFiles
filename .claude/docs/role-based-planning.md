# Role-Based Planning Agents — Constitution

Multi-agent planning system with 6 specialized roles, strict file ownership, and information barriers. Each role has controlled read/write access enforced via MUST/NEVER constraints.

## The 6 Roles

| Role | Agent | Color | Responsibility |
|---|---|---|---|
| Architect | `plan-architect` | blue | System design, API specs, task decomposition, orchestration. **Read-only for all code.** |
| Backend | `plan-backend` | purple | Implements source code. Full R/W on source. **Read-only** on UI, tests, docs. |
| UI | `plan-ui` | yellow | Builds interfaces (CLI or web). Full R/W on UI files. **Read-only** on backend source. |
| Tester | `plan-tester` | red | Writes tests from API spec + docs. **NO read access to implementation source.** |
| Docs | `plan-docs` | green | READMEs, usage guides, API docs. Reads **only** design artifacts — **NO source or tests.** |
| Build | `plan-build` | cyan | Build configs only: CMake, Make, compiler flags, deps. No CI/CD, no infra. |

## Information Flow

```
Architect ──produces──▶ API Spec + Design Artifacts
    │                        │         │         │
    │ orchestrates           │         │         │
    ▼                        ▼         ▼         ▼
 Backend                 UI        Tester     Docs
 (source R/W,        (UI R/W,     (reads     (reads API
  reads UI)          reads src)   API spec    + design)
    │                               + docs)       │
    ▼                                  ▲          │
 Build (build                          └── reads ─┘
  configs only)
```

## Access Control

Three access levels per role: **WRITE** (owns), **READ-ONLY**, **NO ACCESS**.
Full matrix in [role-matrix.md](role-matrix.md).

## Key Constraints

- **Black-box testing**: Tester never sees implementation — tests validate the API contract and documented behavior, not the code.
- **Docs from specs**: Documentation reflects intended design, not implementation details. Stable across refactors.
- **UI separation**: Shared types/DTOs between backend and UI go through the architect. No direct coupling.
- **Architect orchestrates**: Decomposes tasks with `[role]` assignments, reviews cross-boundary changes.

## Orchestration Protocol

The architect decomposes work into tasks tagged with role assignments:

```
- [backend] Implement UserService.create() per API spec
- [ui] Build registration form consuming POST /users
- [tester] Write tests for POST /users from spec
- [docs] Document user registration flow
```

## Delegation Requests

When a role needs changes outside its WRITE zone, it creates a delegation request:

```
DELEGATION REQUEST
From: [requesting role]
To: [owning role]
File: [path]
Change: [description]
Reason: [why needed]
```

## Shared Files

Files like `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `requirements.txt`, `.gitignore` may be edited by any role. Annotate changes with:

```
SHARED FILE CHANGE ([role]): [description of change]
```
