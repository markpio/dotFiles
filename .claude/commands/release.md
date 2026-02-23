## Current repository state

Latest release tag:
!`git tag --sort=-creatordate | grep '^v' | head -1`

Commits since latest release:
!`git tag --sort=-creatordate | grep '^v' | head -1 | xargs -I{} git log {}..HEAD --oneline`

Current branch:
!`git branch --show-current`

Branches:
!`git branch -a`

---

You are helping create a new release using semantic versioning (MAJOR.MINOR.PATCH).

Using the commits listed above:

1. Analyze the changes and propose a version number following semantic versioning:
   - MAJOR: Breaking changes / incompatible API changes
   - MINOR: New features (backwards-compatible)
   - PATCH: Bug fixes (backwards-compatible)

   Provide a one-sentence rationale for the proposed version.

2. Ask the user to confirm the version number or suggest a different one.

3. Once the version is confirmed, execute the release process:
   - Create an annotated git tag with format `vX.Y.Z`
   - Use the commit messages as the basis for the tag annotation
   - Ask the user if they want to push the tag to the remote

4. If the user confirms push, execute `git push --tags` (or `git push origin vX.Y.Z` for a single tag).

Notes:
- Use annotated tags (`git tag -a`) not lightweight tags
- Tag annotation should summarize the changes in this release
- Default tag prefix is `v` (e.g., `v1.2.3`)
- If the user mentions alternative tag prefixes or versioning schemes, adapt accordingly
