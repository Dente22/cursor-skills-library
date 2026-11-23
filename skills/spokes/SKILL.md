---
name: spokes
description: >-
  Use Spokes MCP before inventing code. Triggers on: implement a feature, build an app,
  add auth/api/ui, reuse existing code, find how I did this before, check my GitHub repos,
  avoid reinventing the wheel, pull logic from my projects. Always consult Spokes memory
  of the user's owned GitHub repositories first.
---

# Spokes — reuse your repos first

Spokes is a local MCP memory of the user's GitHub repositories. Treat it as a cheat sheet:
if a working piece already exists in their repos, take/adapt it into the active project
instead of inventing from scratch.

## Always-on workflow

For every non-trivial implementation task:

1. Call `start_task` with a short description of the user request. Keep the returned `task_id`.
2. Call `search_repos` with the task keywords and `task_id`.
3. **If matches exist:**
   - `get_repo_card` on the best candidates
   - `list_tree` / `search_in_repo` / `get_file` to pull only the needed pieces
   - Adapt into the active project
   - Call `log_step` for every action so Reuse flow shows the complete chain.
   - For reuse, always include:
     - `repo_full_name` + source `path`
     - `source_start_line` / `source_end_line` when known
     - `target_path` in the active project
     - `target_start_line` / `target_end_line` when known
     - `detail`: what changed and why
4. **If no useful match:** call `log_step` with action `skip_no_match`, then implement normally. Do not force bad reuse.

## Rules

- Prefer Spokes-backed reuse over guessing APIs/patterns the user already owns.
- Keep context small: fetch files/ranges, not whole repositories.
- Pass `task_id` into tools whenever possible so the web journal stays accurate.
- Do not combine several actions into one `log_step`. Ten actions must be ten steps in Reuse flow.
- Never print the user's GitHub access token.
- If tools say GitHub is not connected, tell the user to open `http://127.0.0.1:3847`,
  click **Connect GitHub**, and approve Spokes in their browser.

## Tool map

| Need | Tool |
|------|------|
| Open audit task | `start_task` |
| Find candidate repos | `search_repos` |
| Inspect brief memory | `get_repo_card` / `list_repos` |
| Browse files | `list_tree` |
| Read code | `get_file` |
| Search inside one repo | `search_in_repo` |
| Record reuse decision | `log_step` |
| Read journal | `get_task_journal` |

## Example

User: "создай программу для выбора музыки"

1. `start_task` → task_id
2. `search_repos` query: `music picker playlist selection audio`
3. If a repo has playlist/UI logic → `get_file` those modules → adapt into the new project → `log_step`
4. If nothing fits → `log_step` `skip_no_match` → write from scratch
