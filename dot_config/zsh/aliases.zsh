# Better ls
alias ls='eza --icons --group-directories-first --across'

# Detailed listing
alias ll='eza -lh --icons --git --group-directories-first'

# Detailed listing including hidden files
alias la='eza -lah --icons --git --group-directories-first'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

alias cd="z"

# Reuse cd completions for zoxide (avoids defining a separate completion function)
compdef zoxide=cd

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vi='nvim'
alias vim='nvim'

# Git
git() {
    if [[ "$1" != switch && "$1" != checkout ]]; then
        command git "$@"
        return $?
    fi

    local output result=0
    local worktree_error="^fatal: .* is already used by worktree at '(.*)'$"

    output=$(LC_ALL=C command git "$@" 2>&1) || result=$?
    if [[ -n "$output" ]]; then
        if (( result != 0 )); then
            print -ru2 -- "$output"
        else
            print -r -- "$output"
        fi
    fi

    if (( result != 0 )) && [[ "$output" =~ "$worktree_error" ]]; then
        print -r -- "Changing directory to: $match[1]"
        builtin cd -- "$match[1]"
        return $?
    fi

    return $result
}

alias gsw='git switch'

# =========================================================
# chezmoi
# =========================================================

alias c="chezmoi"
alias ce="chezmoi edit"

# =========================================================
# Kube
# =========================================================
alias k="kubectl"
alias t="talosctl"
