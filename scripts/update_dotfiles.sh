#!/usr/bin/env zsh
# pushdf: sync your dotfiles with your remote.
# 1. Pulls changes from your other machines (pull --rebase)
# 2. Warns about Homebrew packages you have installed that aren't in the Brewfile
# 3. Shows what changed and asks for a commit message before pushing

set -e

DOTFILES="${0:A:h:h}"
cd "$DOTFILES"
BRANCH="$(git branch --show-current)"

echo "==> Pulling changes"
git pull --rebase --autostash origin "$BRANCH"

# Installed packages that aren't in the Brewfile
if command -v brew &>/dev/null; then
  extra="$(brew bundle cleanup --file="$DOTFILES/Brewfile" 2>/dev/null \
    | awk '/^Would uninstall (formulae|casks):/ {p=1; next} /^Would/ {p=0} p' || true)"
  if [[ -n "$extra" ]]; then
    echo "\033[1;33m==> Installed but not in the Brewfile:\033[0m"
    echo "$extra" | sed 's/^/   /'
    echo "   Add them to the Brewfile if you want them on every machine."
  fi
fi

if [[ -z "$(git status --porcelain)" ]]; then
  if [[ -n "$(git rev-list @{u}..HEAD)" ]]; then
    echo "==> No new changes, but there are unpushed commits"
    git push origin "$BRANCH"
    echo "\033[1;32m✔ Dotfiles pushed\033[0m"
  else
    echo "\033[1;32m✔ Everything up to date, nothing to push\033[0m"
  fi
  exit 0
fi

echo "==> Changes:"
git status --short

read "msg?Commit message (Enter = date, Ctrl+C = cancel): "
git add -A
git commit -m "${msg:-Update dotfiles on $(date)}"
git push origin "$BRANCH"

echo "\033[1;32m✔ Dotfiles updated and pushed\033[0m"
