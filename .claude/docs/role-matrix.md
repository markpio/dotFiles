# Role-Based Planning — Access Control Matrix

Detailed per-role file access. Three levels: **WRITE** (owns), **READ-ONLY**, **NO ACCESS**.
See [role-based-planning.md](role-based-planning.md) for the full constitution.

## Per-Role Access

| Role | WRITE (owns) | READ-ONLY | NO ACCESS |
|---|---|---|---|
| **architect** | `docs/design/**`, `docs/adr/**`, `docs/api/**`, `.claude/plans/**` | Everything else | — |
| **backend** | `src/**`, `internal/**`, `pkg/**`, `cmd/**`, `lib/**` | `ui/**`, `public/**`, `tests/**`, `test/**`, `docs/**` | — |
| **ui** | `ui/**`, `src/ui/**`, `src/components/**`, `src/pages/**`, `src/views/**`, `src/hooks/**`, `src/styles/**`, `src/assets/**`, `public/**`, `src/routes/**`, `src/stores/**`, `src/cli/**` | `src/**`, `internal/**`, `pkg/**`, `cmd/**`, `lib/**`, `docs/**` | `tests/**`, build files |
| **tester** | `tests/**`, `test/**`, `__tests__/**`, `*_test.*`, `*.test.*`, `*.spec.*`, `fixtures/**`, `testdata/**`, `mocks/**`, test configs | `docs/api/**`, `docs/**` (usage, README, expected I/O) | `src/**`, `internal/**`, `lib/**`, `cmd/**`, `ui/**` |
| **docs** | `docs/**` (except `docs/design/**`, `docs/adr/**`), `README.md`, `INSTALL.md`, `USAGE.md` | `docs/design/**`, `docs/adr/**`, `docs/api/**` | `src/**`, `tests/**`, build files |
| **build** | `CMakeLists.txt`, `Makefile`, `Justfile`, `build/**`, `cmake/**`, `*.cmake`, `conanfile.*`, `vcpkg.json`, `meson.build` | `src/**` (structure/deps only) | `tests/**`, `docs/**`, `ui/**` |
| **git** | `.gitignore`, `.gitattributes`, `CHANGELOG.md`, `VERSION`, `.version`, `release-notes/**`, tag/branch operations (git commands) | Everything else | — |

## Shared Files

Any role may edit these with `SHARED FILE CHANGE ([role])` annotation:

- `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`
- `requirements.txt`, `.gitignore`
- `CHANGELOG.md`, `VERSION` (git owns; other roles may read)

## Overlap Resolution

When WRITE zones overlap (e.g. `src/ui/**` for both backend and UI):
- The **more specific** role owns it (UI owns `src/ui/**`)
- Backend's `src/**` excludes UI-owned subdirectories
- Conflicts are resolved by the architect via delegation requests

## Access Enforcement

Access is enforced via MUST/NEVER constraints in each agent's body. Claude Code has no runtime file permissions — agents self-enforce boundaries. Violations should be flagged during architect review.
