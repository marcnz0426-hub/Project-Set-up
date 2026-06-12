# Git Workflow Rules

## Branch Strategy

- **Main branch:** `main` (or `master` if the project uses it). Always deployable.
- **Feature branches:** `feature/<short-description>` (e.g., `feature/user-auth`)
- **Fix branches:** `fix/<short-description>` (e.g., `fix/login-timeout`)
- **Chore branches:** `chore/<short-description>` (e.g., `chore/update-deps`)

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/) format:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`

Examples:
- `feat(auth): add login with email and password`
- `fix(api): handle null response from external service`
- `docs(readme): add setup instructions`

## Rules

1. **Check current branch and worktree state** before major changes. Know where you are.
2. **Use worktrees for isolated feature work** when appropriate. (See Phase 03 decision tree.)
3. **Do not discard or revert user changes** without explicit permission. Always ask first.
4. **Before merge or PR**, request code review and run verification.
5. **Keep commits, PRs, and handoff notes aligned** with the actual work done.

## Rebase vs Merge

- **Rebase** local-only feature branches to keep history linear (when the branch hasn't been pushed or shared).
- **Merge** shared branches to preserve collaboration history.
- **Never force-push** to shared branches without explicit user approval.

## Tagging

- Tag releases with semantic version: `v1.0.0`, `v1.2.3`
- Use annotated tags: `git tag -a v1.0.0 -m "Release v1.0.0"`
