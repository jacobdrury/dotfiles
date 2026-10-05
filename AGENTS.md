# Chezmoi data conventions

- For changes to managed files, edit the chezmoi source in this repository. Do not edit the deployed destination directly. Inspect with `chezmoi diff` and apply from the repository after updating the source; merge any destination-only edits into the source first.
- Put values shared by every machine in `.chezmoidata/shared.toml`.
- Put machine-specific values in `.chezmoidata/host-<label>.toml`, nested under `[hosts."<hostname>"]`.
- Keep secrets out of chezmoi data. Public identifiers, such as a GPG key ID, are safe to store there.
- In templates, select the current machine once with `{{ $host := index .hosts .chezmoi.hostname }}` and read machine-specific values from `$host`. Do not add hostname conditionals or role aliases.
- When adding a host, define every host value required by existing templates so chezmoi's `missingkey=error` validation remains useful.

# Dependency management (Renovate)

Prefer pins Renovate can bump. When adding or changing a dependency, choose a Renovate-readable form when a clean datasource exists. Keep `renovate.json` in sync if a new pattern needs a manager or package rule. Do not install repo-root files such as `renovate.json` into `$HOME`; they belong in `.chezmoiignore`.

## Prefer these patterns

- **Toolchain versions:** pin in `dot_proto/dot_prototools` (`tool = "x.y.z"`). Renovate's `proto` manager covers this file.
- **Git checkouts** (plugins, TPM, similar): use a `.chezmoiexternal.toml` `git-repo` entry with a full 40-char `revision` SHA. Put the Renovate annotation on the line immediately above the `[...]` section, matching existing externals:

  ```toml
  # renovate: datasource=git-refs depName=owner/repo packageName=https://github.com/owner/repo versioning=git
  ["plugins/repo"]
      type = "git-repo"
      url = "https://github.com/owner/repo.git"
      revision = "<full-sha>"
  ```

  Source the installed files from shell config; do not clone tip at runtime.
- **Release artifacts in `run_onchange_*.tmpl`:** pin a version variable used by the download URL, with a Renovate comment on the line immediately above:

  ```bash
  # renovate: datasource=github-releases depName=owner/repo
  version="v1.2.3"
  ```

## Do not fake Renovate coverage

- **Homebrew Brewfile** entries stay unversioned. Homebrew is rolling and has no lockfile Renovate can update; leave `brew` / `cask` lines as package names only.
- Do not add a version string only as a reinstall/cache-buster if the install command ignores it (for example marketplace plugins that always install latest). Either pin a real artifact Renovate can track, or leave it untracked and document why.
- Prefer not to tip-track with `git clone` / `git pull` in shell startup when a pinned chezmoi external works.
