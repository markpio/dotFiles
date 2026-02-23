# Command Templates

Reusable slash command templates organized by language and domain. Copy these into project-specific `.claude/commands/` directories.

## Global vs Project Commands

**Global commands** (`~/.claude/commands/`):
- Available to ALL projects automatically
- Generic, work with any git project
- Examples: `/release` (semantic versioning for any repo)
- No project-specific paths or documentation references

**Project commands** (`.claude/commands/` in each project):
- Specific to a single project
- Copied/customized from command-templates
- Reference project-specific paths, docs, build systems
- Override global commands if same name exists

**Command templates** (`~/.claude/command-templates/`):
- Starting points for creating project commands
- Copy and customize per project
- Not directly executable (just templates)

## Directory Structure

```
~/.claude/command-templates/
├── cpp/          # C++ project commands
├── python/       # Python project commands
├── web/          # Web development commands
└── general/      # Language-agnostic commands
```

## Purpose

Command templates provide:

1. **Consistency** — standardized commands across all projects
2. **Quick setup** — copy templates instead of writing from scratch
3. **Best practices** — pre-configured with project-specific context patterns
4. **Customization** — templates are starting points, modify per project

## Usage

### Setting Up a New Project

1. Navigate to your project directory
2. Create `.claude/commands/` if it doesn't exist
3. Copy relevant templates:
   ```sh
   cp ~/.claude/command-templates/cpp/* ~/my-project/.claude/commands/
   ```
4. Customize templates with project-specific paths, build commands, etc.

### Using Commands

Once copied, invoke with `/command-name` in Claude conversations:

```
/test
/build
/lint
```

## Template Categories

### cpp/

Commands for C++ development:

- `/build` — CMake configure + build with project-specific flags
- `/test` — Run test suites (CTest, Google Test, etc.)
- `/lint` — Run clang-tidy with project `.clang-tidy` config
- `/format` — Apply clang-format to source files
- `/clean` — Remove build artifacts
- `/debug-setup` — Launch GDB with common breakpoints

### python/

Commands for Python projects:

- `/test` — Run pytest with coverage
- `/lint` — Run ruff, mypy, or pylint
- `/format` — Apply black/ruff formatting
- `/deps` — Install/update dependencies (pip, poetry, uv)
- `/venv` — Create/activate virtual environment
- `/type-check` — Run mypy type checking

### web/

Commands for web development (JS/TS):

- `/dev` — Start development server
- `/build` — Production build
- `/test` — Run Jest/Vitest
- `/lint` — ESLint + Prettier
- `/deps` — npm/yarn/pnpm install
- `/deploy` — Deploy to staging/production

### general/

Language-agnostic commands:

- `/status` — Git status + recent commits
- `/review-changes` — Show diff with AI summary
- `/docs` — Generate/update documentation
- `/todo` — List TODO/FIXME comments
- `/search` — Smart codebase search with context
- `/release` — Manage project-specific releases (spec/source) with version proposals
  - Note: A simpler generic `/release` is available globally in `~/.claude/commands/` for standard semantic versioning

## Best Practices

### Creating New Templates

1. **Use absolute paths in templates for portability**
   ```markdown
   cd ~/projects/myproject && make test
   ```

2. **Include error handling**
   ```markdown
   Run the test suite. If tests fail, analyze failures and suggest fixes.
   ```

3. **Add context about project structure**
   ```markdown
   Source files are in src/, tests in tests/. Use CMake preset "dev".
   ```

4. **Make commands composable**
   ```markdown
   /lint then /test then /build
   ```

### Customizing Templates

After copying to a project:

1. Replace placeholder paths with actual project paths
2. Update build commands to match project tooling
3. Add project-specific flags/options
4. Include domain knowledge (e.g., "use async/await patterns")

### Naming Conventions

- Use lowercase with hyphens: `/run-tests`, `/build-release`
- Keep names short and memorable
- Avoid language-specific prefixes (template directory already indicates language)
- Use verbs for actions: `/format`, `/deploy`, `/analyze`

## Examples

### Example: Setting Up a C++ Project

```sh
# Create commands directory
mkdir -p ~/my-cpp-project/.claude/commands

# Copy C++ templates
cp ~/.claude/command-templates/cpp/build.md ~/my-cpp-project/.claude/commands/
cp ~/.claude/command-templates/cpp/test.md ~/my-cpp-project/.claude/commands/
cp ~/.claude/command-templates/general/status.md ~/my-cpp-project/.claude/commands/

# Edit build.md to customize
nvim ~/my-cpp-project/.claude/commands/build.md
```

### Example: Template Content (cpp/build.md)

```markdown
# Build Command

Configure and build the C++ project using CMake.

Steps:
1. cd to project root
2. Create build directory if needed
3. Run: cmake -B build -DCMAKE_BUILD_TYPE=Release
4. Run: cmake --build build -j$(nproc)
5. Report any build errors with suggested fixes
```

## Maintenance

- Keep templates minimal — projects will extend them
- Update templates when you discover better patterns
- Archive outdated templates rather than deleting (move to `old/` subdirectory)
- Document breaking changes when updating templates

## Related

- See `~/.claude/docs/git-workflow.md` for git-specific commands
- See `~/.claude/CLAUDE.md` for agent-specific workflows
- See `~/.claude/agents/` for agents that can help generate custom commands
