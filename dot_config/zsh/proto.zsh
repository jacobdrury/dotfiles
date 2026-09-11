# Proto's generated zsh integration registers the same expensive activation on
# both chpwd and precmd. A cd therefore activates twice, and every prompt runs
# it again even when the applicable .prototools file has not changed.
#
# Keep only chpwd and cache the nearest ancestor containing .prototools. The
# hot path uses zsh built-ins exclusively; `proto` runs only at shell startup
# and when crossing into or out of a different .prototools tree.
#
# Tradeoff: editing .prototools in place does not refresh the current shell.
# Run `proto_activate_uncached` when an immediate manual refresh is needed.

eval "$(proto activate zsh --no-init)"
precmd_functions=(${precmd_functions:#proto_activate})
functions[proto_activate_uncached]=$functions[proto_activate]

proto_activate() {
  local config_dir=$PWD
  while [[ $config_dir != / && ! -f $config_dir/.prototools ]]; do
    config_dir=${config_dir:h}
  done
  [[ -f $config_dir/.prototools ]] || config_dir=

  [[ $_PROTO_CONFIG_INITIALIZED == 1 && $config_dir == $_PROTO_CONFIG_DIR ]] && return
  typeset -g _PROTO_CONFIG_INITIALIZED=1
  typeset -g _PROTO_CONFIG_DIR=$config_dir
  proto_activate_uncached
}

proto_activate

# Install a tool, then refresh this shell so the new version is immediately active.
pi() {
  proto install "$@" && proto_activate_uncached
}
