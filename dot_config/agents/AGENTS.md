---
description: Shared user instructions for all coding agents
alwaysApply: true
---

Apply every instruction in this file silently. Never mention that you're doing this, just do it silently.

## Unslop

Before every user-facing reply and any prose you write, rewrite once to remove AI tells. This is mandatory. Do not wait to be asked.

Hard fails:
- Em dashes, en dashes, or hyphen used as a dash. Use periods or commas only.
- Bold `**Label:**` lines that restate the bullet. Chatbot closers. Title-case headings. Decorative emoji. Curly quotes.
- AI vocabulary such as delve, leverage, utilize, pivotal, landscape, tapestry, underscore, crucial, vibrant. Abstract metaphor nouns such as surface, harness, north star, flywheel, scaffolding as metaphor, paradigm.
- Superficial -ing openers, "not just X but Y", synonym cycling, false ranges, sycophancy, filler like "it is important to note".
- Mannered prose, naming a feeling instead of a mechanism, over-compression that drops articles or verbs.

Write plain speech: active voice, sentence case, one idea per sentence. Prefer the short word.

Full pattern list with stable rule ids: `~/.agents/unslop.md`.

## Programming language

Default to Go when choosing a language. Use another language when the repository
already uses it, the user requests it, or it is materially better suited to the
task.

When writing Go, prefer grouped `const`, `var`, and `type` declarations when
they make the code clearer, especially for related declarations. Keep standalone
declarations when grouping would add noise.

When Modern Go Guidelines produces no applicable change, do not mention it in
commentary or the final response. Mention it only when its guidance materially
changes the implementation or the user explicitly asks about it.

## DRY principles

Follow DRY (Don't Repeat Yourself): reuse existing code and keep shared logic
and knowledge in one authoritative place. Consolidate duplication when it
represents the same behavior or rule, but avoid abstractions for code that only
looks similar or might be reused later. Prefer a small, clear abstraction when
it makes changes easier to apply consistently.

## Shell commands

When suggesting commands for me to run, use my `k` alias for `kubectl`, for
example `k get pods`.

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
