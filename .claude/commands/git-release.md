---
description: Create a git release with changelog and version bumps
allowed-tools: Bash, Read, Write, Edit, Glob, Grep
---

## Current repository state

Latest release tag:
!`git tag --sort=-creatordate | grep '^v' | head -1`

Commits since latest release:
!`git tag --sort=-creatordate | grep '^v' | head -1 | xargs -I{} git log {}..HEAD --oneline --no-decorate`

Full commit messages since latest release (for changelog):
!`git tag --sort=-creatordate | grep '^v' | head -1 | xargs -I{} git log {}..HEAD --format='%h %s%n%b---'`

Current branch:
!`git branch --show-current`

CHANGELOG.md exists:
!`test -f CHANGELOG.md; echo $?`

---

You are helping create a new release. Follow these steps in order, pausing for user confirmation at each decision point.

## Step 1: Analyze commits and propose version

Parse the commits listed above using conventional commit format (`type(scope): description`).

Categorize each commit:
- **BREAKING** — commits with `!` after the type/scope (e.g. `feat!:`) or containing `BREAKING CHANGE:` in the body → triggers MAJOR bump
- **feat** — new features → triggers MINOR bump
- **fix** — bug fixes → triggers PATCH bump
- **refactor**, **chore**, **docs**, **style**, **perf**, **test**, **ci**, **build** — non-bumping by default, included in PATCH

Determine the highest applicable bump:
- Any BREAKING → MAJOR
- Any feat (no breaking) → MINOR
- Only fixes/other → PATCH

Present the proposed version with a one-sentence rationale, listing the key commits that drove the decision.

Ask the user to confirm or provide an alternative version.

## Step 2: Branch check

Check the current branch:
- If on `main` or `master`: proceed normally
- If on another branch: warn the user and ask whether to:
  1. Continue releasing from the current branch
  2. Switch to main/master first
  3. Create a release branch (`release/vX.Y.Z`)

Proceed only after the user confirms.

## Step 3: Version file bumps

Search the project root for files that commonly contain version strings:
- `package.json` (look for `"version": "..."`)
- `CMakeLists.txt` (look for `project(... VERSION ...)` or `set(PROJECT_VERSION ...)`)
- `Cargo.toml` (look for `version = "..."` under `[package]`)
- `pyproject.toml` (look for `version = "..."`)
- `setup.py` / `setup.cfg` (look for `version=`)
- `version.txt` or `VERSION`
- `meson.build` (look for `version:`)

For each file found with a version string:
- Show the current version and the proposed new version
- Ask the user which files to update (or skip all if none found)

Update confirmed files with the new version.

## Step 4: Changelog generation

Generate a changelog entry for this release, grouped by type:

```
## [vX.Y.Z] - YYYY-MM-DD

### Breaking Changes
- description (hash)

### Features
- description (hash)

### Bug Fixes
- description (hash)

### Other Changes
- description (hash)
```

Omit empty sections. Use the short commit hash as reference.

- If `CHANGELOG.md` exists: prepend the new entry after the first heading (or after any front-matter/intro paragraph)
- If `CHANGELOG.md` does not exist: create it with a `# Changelog` heading followed by the new entry

Show the user the generated changelog entry and ask for confirmation before writing.

## Step 5: Commit release changes

If any files were modified (version bumps or changelog):
- Stage all modified files
- Create a commit with message: `chore: release vX.Y.Z`
- Show the commit to the user

If no files were modified, skip this step.

## Step 6: Create annotated tag

Create an annotated git tag:
```
git tag -a vX.Y.Z -m "<release notes>"
```

Use the changelog entry (without markdown formatting) as the tag annotation message.

Show the created tag to the user.

## Step 7: Push

Ask the user if they want to push to the remote:
1. Push commit and tag (`git push && git push --tags`)
2. Push tag only (`git push origin vX.Y.Z`)
3. Don't push (manual push later)

Execute the user's choice.

## Step 8: Save approved output as example

If the user approved the final release (tag was created successfully), append the changelog entry and version rationale to `~/.claude/commands/git-release-examples.md` as a new example under a heading with the version and date. This helps calibrate future releases.

Format each saved example as:

```
### vX.Y.Z — YYYY-MM-DD (project-name)

**Rationale:** <the version rationale you presented>

**Changelog:**
<the approved changelog entry>
```

If the file does not exist, create it with a `# Git Release — Approved Examples` heading first.

## Progressive learning

**Auto-update rules:** During this workflow, if the user corrects your output, rejects a proposal, or states something should always or never be done (e.g. "don't include chore commits in the changelog", "always use the full hash"), immediately append the lesson as a new bullet to the `## Rules` section at the bottom of THIS file (`~/.claude/commands/git-release.md`). Phrase each rule as a clear imperative (e.g. "Exclude chore commits from changelog entries"). Do not duplicate existing rules.

**Auto-save examples:** When the user explicitly approves the final output (confirms the tag or push), save the example as described in Step 8. Only save after a fully successful release, not partial runs.

## Notes

- Always use annotated tags (`git tag -a`), never lightweight tags
- Default tag prefix is `v` (e.g., `v1.2.3`)
- If there are no previous tags, treat all commits as the initial release and default to `v0.1.0`
- If the user mentions alternative versioning schemes or tag prefixes, adapt accordingly
- Keep changelog entries concise — use the commit subject line, not the full body

## Rules

<!-- Rules are auto-appended here when the user corrects behavior during a release. -->
