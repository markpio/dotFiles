## Current repository state

Latest spec release tag:
!`git tag --sort=-creatordate | grep '^spec-v' | head -1`

Latest source release tag:
!`git tag --sort=-creatordate | grep -v '^spec-v' | grep '^v' | head -1`

Commits on main since the latest spec release:
!`git tag --sort=-creatordate | grep '^spec-v' | head -1 | xargs -I{} git log {}..main --oneline`

Commits on main since the latest source release:
!`git tag --sort=-creatordate | grep -v '^spec-v' | grep '^v' | head -1 | xargs -I{} git log {}..main --oneline`

Branches:
!`git branch -a`

---

Read `docs/release-process.md`, `docs/release-process-spec.md`, and
`docs/release-process-source.md` to understand the versioning increment
guidelines and the full release process.

Using the commits listed above:

1. Propose a version number for **both** a spec release and a source release,
   with a one-sentence rationale for each (referencing the increment guidelines).
2. Ask the user whether they want a spec release or a source release.
3. Once the user has chosen the release type, compare the proposed version number
   against the version currently recorded in the codebase:
   - For a **spec release**: read `docs/design.md` and extract the version from the
     title line (`**Version X.Y.Z`).
   - For a **source release**: check every file listed under "Version Bump Locations"
     in `docs/release-process-source.md` and extract the version recorded there.
     If no files are listed, skip this check.
   If the proposed version differs from the version found in the codebase, present
   both versions to the user and ask which one to use. Use whichever version the
   user selects going forward.
4. If the selected version differs from what is currently in the codebase, update
   all version bump locations (as specified in the release-type-specific doc) to
   the selected version before proceeding with the rest of the release process.
5. Execute the complete release process for the agreed tag.
