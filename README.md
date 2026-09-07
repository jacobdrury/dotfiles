# Dotfiles

Personal [chezmoi](https://www.chezmoi.io/)-managed dotfiles.

## Prerequisites

Install these before the first `chezmoi init`:

1. **[Homebrew](https://brew.sh/)** — package manager; initialized in `.zprofile` via `brew shellenv`
2. **git** — usually already on macOS, or `brew install git`
3. **[chezmoi](https://www.chezmoi.io/install/)** — `brew install chezmoi`

Everything else is installed by `chezmoi apply` via Homebrew Bundle.

## Homebrew packages

Packages are declared in [`~/.config/homebrew/Brewfile`](dot_config/homebrew/Brewfile), grouped into:

1. **Required by configs** — shell, prompt, editor aliases
2. **Dev tools** — `gh`, `git`
3. **Apps** — GUI / personal software

On apply, `run_onchange_before_brew-bundle` runs `brew bundle` whenever that file changes.

```sh
# edit the package list
ce ~/.config/homebrew/Brewfile

# install/update from the Brewfile (also happens automatically on apply when it changes)
brew bundle --file=~/.config/homebrew/Brewfile
```

JetBrainsMono Nerd Font is installed automatically on apply via a separate `run_onchange_` script.

## Setup

```sh
chezmoi init --apply jacobdrury/dotfiles
```

Or, if this repo is already the chezmoi source directory:

```sh
chezmoi apply
```

The first apply:

1. Runs `brew bundle` from the Brewfile
2. Installs `/etc/zshenv` (sets `ZDOTDIR`; prompts for `sudo`)

Then open a new login shell:

```sh
exec zsh -l
```

## Day-to-day

```sh
c edit ~/.config/zsh/.zshrc          # edit a managed file (opens in Zed, then applies)
ce ~/.config/homebrew/Brewfile       # add/remove brew packages
c apply                              # apply pending changes (runs brew bundle if Brewfile changed)
c diff                               # preview what would change
c status                             # see managed file status
```

`c` is an alias for `chezmoi`. Auto-commit and auto-push are enabled, so edits made through `chezmoi edit` are committed and pushed automatically.
