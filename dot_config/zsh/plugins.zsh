# =========================================================
# Plugins (managed by chezmoi externals; see .chezmoiexternal.toml)
# =========================================================

ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_source() {
  local plugin_path="${ZPLUGINDIR}/${1}"
  local plugin_file="${plugin_path}/${1}.plugin.zsh"
  if [[ ! -f "$plugin_file" ]]; then
    echo "ERROR: zsh plugin missing: ${plugin_file}" >&2
    echo "Run: chezmoi apply" >&2
    return 1
  fi
  source "$plugin_file"
}

_zplugin_source zsh-autosuggestions
_zplugin_source zsh-history-substring-search
_zplugin_source fast-syntax-highlighting
