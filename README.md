# Dotfiles

Personal [chezmoi](https://www.chezmoi.io/)-managed dotfiles.

## Prerequisites

Install these before the first `chezmoi init`:

1. **[Homebrew](https://brew.sh/)** — package manager; also initializes the shell via `.zprofile`
2. **git** — usually already present on macOS, or `brew install git`
3. **[chezmoi](https://www.chezmoi.io/install/)** — `brew install chezmoi`
4. **[Zed](https://zed.dev/)** — default editor used by chezmoi and shell `EDITOR`/`VISUAL`
5. **[proto](https://moonrepo.dev/proto)** — toolchain manager; shims are added to `PATH` in `.zshrc`

## Setup

```sh
chezmoi init --apply jacobdrury/dotfiles
```

Or, if this repo is already the chezmoi source directory:

```sh
chezmoi apply
```

## Day-to-day

```sh
c edit ~/.zshrc   # edit a managed file (opens in Zed, then applies)
c apply           # apply pending changes
c diff            # preview what would change
c status          # see managed file status
```

`c` is an alias for `chezmoi`. Auto-commit and auto-push are enabled, so edits made through `chezmoi edit` are committed and pushed automatically.
