#!/usr/bin/env bash
# Full setup on a fresh machine (macOS or Linux).
# Safe to re-run: anything already installed is skipped.
#
# Usage: ./install.sh            -> everything
#        ./install.sh --links    -> only symlinks and git hooks (what a `git pull` does)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "==> Operating system: $OS"

# ----------------------------
# Homebrew + Brewfile
# ----------------------------
install_brew() {
  if ! command -v brew &>/dev/null; then
    # Homebrew isn't on the PATH until .zshrc is loaded
    [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    [[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ "$OS" == "Linux" ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi

  echo "==> Installing packages from the Brewfile"
  brew bundle --file="$DOTFILES/Brewfile" || echo "   -> ⚠️  Some Brewfile packages failed"
}

# ----------------------------
# Oh My Zsh, Powerlevel10k and plugins
# ----------------------------
clone_if_missing() {
  local repo="$1" dst="$2"
  if [[ -d "$dst" ]]; then
    echo "   -> $(basename "$dst") already installed"
  else
    git clone --depth=1 "$repo" "$dst"
  fi
}

install_zsh() {
  if ! command -v zsh &>/dev/null; then
    echo "   -> ⚠️  zsh isn't installed (sudo apt install zsh / sudo pacman -S zsh)"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh"
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  echo "==> zsh theme and plugins"
  clone_if_missing https://github.com/romkatv/powerlevel10k.git                  "$ZSH_CUSTOM/themes/powerlevel10k"
  clone_if_missing https://github.com/zsh-users/zsh-autosuggestions              "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting          "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  clone_if_missing https://github.com/zdharma-continuum/fast-syntax-highlighting "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
  clone_if_missing https://github.com/marlonrichert/zsh-autocomplete             "$ZSH_CUSTOM/plugins/zsh-autocomplete"
}

# ----------------------------
# Git identity, kept out of the repo in ~/.gitconfig.local
# ----------------------------
setup_git_identity() {
  local local_cfg="$HOME/.gitconfig.local"
  if git config --file "$local_cfg" user.name &>/dev/null; then
    return
  fi
  if [[ -t 0 ]]; then
    echo "==> Git identity (saved to ~/.gitconfig.local, never committed)"
    read -rp "   Name:  " name
    read -rp "   Email: " email
    [[ -n "$name" ]]  && git config --file "$local_cfg" user.name "$name"
    [[ -n "$email" ]] && git config --file "$local_cfg" user.email "$email"
  else
    echo "==> Set your git identity in ~/.gitconfig.local:"
    echo "   git config --file ~/.gitconfig.local user.name  \"Your Name\""
    echo "   git config --file ~/.gitconfig.local user.email \"you@example.com\""
  fi
}

# ----------------------------
# Symlinks, hooks and yazi
# ----------------------------
install_links() {
  echo "==> Symlinks"
  "$DOTFILES/scripts/link.sh"

  echo "==> Enabling git hooks (dotfiles are re-applied on every git pull)"
  git -C "$DOTFILES" config core.hooksPath .githooks

  if command -v ya &>/dev/null; then
    echo "==> yazi packages"
    ya pkg install || true
  fi
}

if [[ "${1:-}" == "--links" ]]; then
  install_links
  exit 0
fi

install_brew
install_zsh
echo "==> Nerd Fonts"
"$DOTFILES/scripts/install-nerd-fonts.sh" --essential
install_links
setup_git_identity

if [[ "$(basename "${SHELL:-}")" != "zsh" ]] && command -v zsh &>/dev/null; then
  echo "==> Your shell isn't zsh. Switch with: chsh -s \"$(command -v zsh)\""
fi

if command -v gh &>/dev/null && ! gh auth status &>/dev/null; then
  echo "==> Log in to GitHub so git can push: gh auth login"
fi

if command -v txoko &>/dev/null; then
  echo "==> To let txoko grow with your commits and screen time:"
  echo "   txoko hook install && txoko daemon install"
fi

echo "✅ Done. Open a new terminal or run: exec zsh"
