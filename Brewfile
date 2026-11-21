# Everything the configs in this repo use.
# Install: brew bundle --file=~/dotfiles/Brewfile
# `pushdf` warns you about anything installed that isn't listed here.

# ----------------------------
# Shell and terminal
# ----------------------------
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "eza"
brew "bat"
brew "fzf"
brew "zoxide"
brew "tmux"
brew "thefuck"
brew "tree"
brew "htop"
brew "neofetch"

# ----------------------------
# Development
# ----------------------------
brew "git"
brew "gh"
brew "neovim"
brew "ripgrep"
brew "fd"
brew "jq"

# ----------------------------
# yazi and its previews (images, video, PDF, archives, Markdown)
# ----------------------------
brew "yazi"
brew "ffmpeg"
brew "ffmpegthumbnailer"
brew "imagemagick"
brew "poppler"
brew "resvg"
brew "sevenzip"
brew "rust"          # to build mdv for Markdown previews: cargo install --root ~/.local mdv

# ----------------------------
# Just for fun (comment out what you don't want)
# ----------------------------
brew "bjarneo/cliamp/cliamp"      # music in the terminal (pulls in yt-dlp)
cask "lifeofaitor/tap/txoko"      # a bonsai that grows while you work

# ----------------------------
# macOS only
# ----------------------------
if OS.mac?
  cask "kitty"
  cask "font-symbols-only-nerd-font"
  cask "orbstack"    # runs docker containers
end
