---
name: unslop
description: >-
  Rewrite prose to remove AI tells. Use when the user asks to unslop, clean up
  writing, or fix AI-sounding text. Day-to-day replies already follow the Unslop
  gate in ~/.config/agents/AGENTS.md; do not load this skill only for that.
---

# Unslop

Rewrite the target text using the pattern catalog at `~/.agents/unslop.md`
(stable rule ids 3–33). Scan for those patterns, then rewrite. Preserve meaning
and match the intended tone.
