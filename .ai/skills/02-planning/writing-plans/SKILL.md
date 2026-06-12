---
name: writing-plans
description: Use when you have a spec or requirements for a multi-step task, before touching code
---

# Writing Plans

## Overview

Write comprehensive implementation plans assuming the engineer has zero context for our codebase and questionable taste. Document everything they need to know: which files to touch for each task, code, testing, docs they might need to check, how to test it. Give them the whole plan as bite-sized tasks. DRY. YAGNI. TDD. Frequent commits.

Assume they are a skilled developer, but know almost nothing about our toolset or problem domain. Assume they don't know good test design very well.

**Announce at start:** "I'm using the writing-plans skill to create the implementation plan."

**Context:** This should be run in a dedicated worktree (created by brainstorming skill).

**Save plans to:** `docs/plans/YYYY-MM-DD-<feature-name>.md`

## Bite-Sized Task Granularity

**Each step is one action (2-5 minutes):**
- "Write the failing test" - step
- "Run it to make sure it fails" - step
- "Implement the minimal code to make the test pass" - step
- "Run the tests and make sure they pass" - step
- "Commit" - step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Feature Name] Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

## Task Structure

```markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

**Step 1: Write the failing test**

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL with "function not defined"

**Step 3: Write minimal implementation**

```python
def function(input):
    return expected
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS

**Step 5: Commit**

```bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
```
```

## Task Priority (MoSCoW)

Assign a priority to every task to guide execution order when time is constrained:

| Priority | Label | Meaning | Drop Policy |
|----------|-------|---------|-------------|
| **M**ust have | Critical path | Feature fails without this | Cannot ship without |
| **S**hould have | Important | Significant value, not blocking | Ship if behind schedule |
| **C**ould have | Nice to have | Polish, minor enhancements | Drop first if time runs low |
| **W**on't have | Out of scope | Explicitly deferred | Never include in this cycle |

**Format in plans:** `**[M]** Task description` or `**[S]** Task description`.

**Must-have tasks** are the minimum viable cut line. If all M tasks are done, the feature is shippable.

## Effort Estimation Heuristics

Use these heuristics to gauge task size and inform batching:

| Complexity Level | Files Touched | Est. Time | Example |
|-----------------|---------------|-----------|---------|
| **Trivial** (fast-path) | 1 file, ≤5 lines | 2-5 min | Typo fix, rename, comment, config change |
| **Small** | 1-2 files | 5-15 min | Single function, simple component variant |
| **Medium** | 3-5 files | 15-45 min | New component with tests, API endpoint |
| **Large** | 6-10 files | 45-90 min | Feature crossing backend + frontend + tests |
| **X-Large** (split me) | 10+ files | 90+ min | Full feature, needs sub-agent or parallelization |

**Flags that increase estimate:**
- New module vs. modifying existing (+25%)
- Requires tests (+30%)
- Crosses layers (schema → API → UI, +50%)
- Touches auth/permissions (+30%)
- Security-sensitive code (+50%)
- Migration or breaking change (+100%)

**If any task exceeds 15 minutes estimated:** consider splitting it.

## Remember
- Exact file paths always
- Complete code in plan (not "add validation")
- Exact commands with expected output
- Reference relevant skills with @ syntax
- DRY, YAGNI, TDD, frequent commits

## Execution Handoff

After saving the plan, offer execution choice:

**"Plan complete and saved to `docs/plans/<filename>.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?"**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
