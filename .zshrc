# ============================
#   zsh configuration
# ============================

# neofetch on startup (outside tmux, before the p10k instant prompt)
if [[ -o interactive ]] && [[ -z "$TMUX" ]] && command -v neofetch >/dev/null; then
  neofetch
fi

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Where this repo lives (used by the aliases below)
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# ----------------------------
# Homebrew (Linux needs it on the PATH before anything else)
# ----------------------------
if [[ "$(uname -s)" == "Linux" && -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ----------------------------
# Oh My Zsh
# ----------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)
source "$ZSH/oh-my-zsh.sh"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ----------------------------
# Environment
# ----------------------------
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------
# Tools (each one only if it is installed)
# ----------------------------
# eza instead of ls (the system one is still there: `command ls`)
command -v eza >/dev/null && alias ls="eza -a --group-directories-first --icons"

# thefuck: type `fuck` after a typo
command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# fzf: Ctrl+R history, Ctrl+T files, `**` + Tab completion
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
  if command -v fd >/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
  command -v bat >/dev/null && \
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}'"
fi

# yazi: `y` opens it and leaves you in the folder you were in when you quit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# ----------------------------
# macOS only
# ----------------------------
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias icloud='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
fi

# ----------------------------
# Aliases
# ----------------------------
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias q="exit"
alias pushdf="$DOTFILES/scripts/update_dotfiles.sh"
alias pulldf="git -C $DOTFILES pull"
alias cheat="bat $DOTFILES/cheatsheets/README.md"

# ----------------------------
# Machine-specific settings (not in the repo)
# ----------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# zoxide: `z` and `zi` (it has to be initialised last)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
