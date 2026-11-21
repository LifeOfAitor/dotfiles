#!/usr/bin/env bash
# Creates the dotfile symlinks. Safe to run as often as you like:
# - if a symlink is already correct, it does nothing
# - if something else is in the way, it moves it to ~/.dotfiles-backup/<date>/ (it never deletes)
#
# Usage: scripts/link.sh [-n]   (-n = dry run, only prints what it would do)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY_RUN=0
[[ "${1:-}" == "-n" ]] && DRY_RUN=1

# ----------------------------
# What gets linked ("path in the repo:path in $HOME")
# ----------------------------
LINKS=(
  ".zshrc:.zshrc"
  ".p10k.zsh:.p10k.zsh"
  ".gitconfig:.gitconfig"
  ".vimrc:.vimrc"
  ".tmux.conf:.tmux.conf"
  ".config/kitty:.config/kitty"
  ".config/htop:.config/htop"
  ".config/neofetch:.config/neofetch"
  ".config/thefuck:.config/thefuck"
  ".config/yazi:.config/yazi"
)

# ----------------------------
# Link
# ----------------------------
changed=0
for entry in "${LINKS[@]}"; do
  src="$DOTFILES/${entry%%:*}"
  dst="$HOME/${entry#*:}"

  if [[ ! -e "$src" ]]; then
    echo "   -> ⚠️  $src doesn't exist, skipping"
    continue
  fi

  # Already points to the right place
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    continue
  fi

  changed=1
  if (( DRY_RUN )); then
    echo "   -> [dry-run] $dst -> $src"
    continue
  fi

  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" || -L "$dst" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${entry#*:}")"
    mv "$dst" "$BACKUP_DIR/${entry#*:}"
    echo "   -> Backed up $dst to $BACKUP_DIR"
  fi
  ln -s "$src" "$dst"
  echo "   -> Linked $dst"
done

(( changed )) || echo "   -> Symlinks up to date"
