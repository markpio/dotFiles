# dotFiles — CLAUDE.md

Bare git dotfiles repo. Work tree: `$HOME/`. Bare repo: `~/.dotFiles/`.
Always use the `config` alias, never plain `git`.

## Documentation

| Topic | File |
|---|---|
| Git workflow & `config` alias | [docs/git-workflow.md](docs/git-workflow.md) |
| Directory / file map | [docs/repo-layout.md](docs/repo-layout.md) |
| Neovim config (plugins, modules, style) | [docs/neovim.md](docs/neovim.md) |
| Shell aliases & prompt | [docs/shell.md](docs/shell.md) |
| C++ tooling (clang-format, cmake, clangd, gdb) | [docs/cpp-dev.md](docs/cpp-dev.md) |
| NixOS configs | [docs/nixos.md](docs/nixos.md) |
| Commit conventions | [docs/commit-conventions.md](docs/commit-conventions.md) |
| Safe editing guidelines | [docs/safe-editing.md](docs/safe-editing.md) |
| Role-based planning agents (constitution) | [docs/role-based-planning.md](docs/role-based-planning.md) |
| Role access control matrix | [docs/role-matrix.md](docs/role-matrix.md) |
| Slash command templates | [docs/command-templates.md](docs/command-templates.md) |

## Agents

Sub-agents in `~/.claude/agents/` — invoke by name for specialized tasks.

| Agent | Purpose |
|---|---|
| `dotfiles-manager` | Primary orchestrator: repo changes, doc management, delegates to specialists |
| `architecture-advisor` | Greenfield systems design: diagrams, ADRs, API contracts |
| `cmake-architect` | CMake build configuration for C++ projects |
| `nvim-config` | Editing and extending this Neovim Lua config safely |
