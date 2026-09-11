# Chezmoi data conventions

- Put values shared by every machine in `.chezmoidata/shared.toml`.
- Put machine-specific values in `.chezmoidata/host-<label>.toml`, nested under `[hosts."<hostname>"]`.
- Keep secrets out of chezmoi data. Public identifiers, such as a GPG key ID, are safe to store there.
- In templates, select the current machine once with `{{ $host := index .hosts .chezmoi.hostname }}` and read machine-specific values from `$host`. Do not add hostname conditionals or role aliases.
- When adding a host, define every host value required by existing templates so chezmoi's `missingkey=error` validation remains useful.
