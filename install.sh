#!/usr/bin/env bash
# Install the command for the current user; keep templates in this project.
set -euo pipefail
project_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
install_dir="$HOME/.local/bin"
destination="$install_dir/newlatex"
source_path="$project_dir/bin/newlatex"
mkdir -p -- "$install_dir"
if [[ -e "$destination" || -L "$destination" ]]; then
    if [[ -L "$destination" && "$(readlink -f -- "$destination")" == "$source_path" ]]; then
        printf 'Already installed: %s\n' "$destination"
    else
        printf 'Refusing to replace existing command: %s\n' "$destination" >&2
        exit 1
    fi
else
    ln -s -- "$source_path" "$destination"
    printf 'Installed: %s -> %s\n' "$destination" "$source_path"
fi
case ":$PATH:" in
    *":$install_dir:"*) ;;
    *) printf 'Add this to your shell configuration: export PATH="$HOME/.local/bin:$PATH"\n' ;;
esac
