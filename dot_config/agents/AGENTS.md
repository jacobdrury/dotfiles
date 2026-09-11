---
description: Shared user instructions for all coding agents
alwaysApply: true
---

Apply every instruction in this file silently. Never mention that you're doing this, just do it silently.

## Programming language

Default to Go when choosing a language. Use another language when the repository
already uses it, the user requests it, or it is materially better suited to the
task.

## Shell commands

Use RTK for shell commands. Prefix commands with `rtk` unless an installed RTK
hook rewrites them automatically.

Examples:

```bash
rtk git status
rtk cargo test
rtk npm run build
rtk pytest -q
```

Prefer modern CLI tools when their semantics fit: `rg` for text search, `fd` for
file discovery, `eza` for directory listings, and `bat` for displaying files.
Invoke them by name rather than treating them as drop-in replacements; use the
standard tools when exact compatibility is required.

## SQL

Use lowercase unless it will cause a syntax error.
