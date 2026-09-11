---
name: maintain-zed-file-types
description: Audit and update this repository's Zed file associations when files are added, renamed, or shown with the wrong language. Use for Zed language detection, file type mappings, or keeping .zed/settings.json current in this Chezmoi repository.
---

# Maintain Zed File Types

Keep `.zed/settings.json` accurate for source files whose language Zed cannot
infer from their names. Preserve unrelated project settings.

## Workflow

1. Inventory files with `rg --files --hidden -g '!.git/**'`. Inspect ambiguous
   files rather than inferring their language from `*.tmpl` alone.
2. Prefer Zed's existing extension, suffix, and shebang detection. Add a
   `file_types` entry only for a file that is ambiguous or misclassified.
3. Match Chezmoi source names as they exist in this repository, including
   `dot_`, `private_`, and `.tmpl`; do not match only their rendered target
   names.
4. Map each template to its rendered language. Never add a catch-all mapping
   for `*.tmpl`, because templates in this repository contain several
   different languages.
5. Treat language identifiers as case-sensitive. Verify the exact `name` in an
   installed extension's `languages/*/config.toml`, or in official Zed
   documentation when the extension is not installed. For example, the INI
   extension registers `ini`, not `INI`.
6. Do not install extensions or enable automatic installation unless the user
   requests it. Report any extension required for a new association.

## Verification

- Run `jq -e . .zed/settings.json`.
- Run `git diff --check`.
- Run `chezmoi apply --dry-run --verbose` and ensure neither `.zed` nor
  `.agents` would be installed into the home directory.
- If Zed already has an affected file open, note that it may need to be closed
  and reopened before its language changes.
