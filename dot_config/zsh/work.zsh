SCRIPT_BASE_DIR="$HOME/Dev/pulsar-dev-scripts"
SCRIPT_DIR="$SCRIPT_BASE_DIR/scripts"
SCRIPT_ENV_FILE="$SCRIPT_BASE_DIR/.env"

for script in "$SCRIPT_DIR"/*.sh(N); do
  source "$script"
done

# =========================================================
# Aliases
# =========================================================
alias g='grove checkout'
alias f='frm'
alias fr='frm run'
