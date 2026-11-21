#!/usr/bin/env bash
# Installs Nerd Fonts on macOS (Homebrew casks) or Linux (~/.local/share/fonts).
#
# Usage: install-nerd-fonts.sh               -> every font in the list
#        install-nerd-fonts.sh --essential   -> only the ones these configs use

set -euo pipefail

# Names exactly as in https://github.com/ryanoasis/nerd-fonts/releases
# (the Homebrew cask is derived from them: JetBrainsMono -> font-jetbrains-mono-nerd-font)
essential=(
  Meslo          # kitty and Powerlevel10k
  JetBrainsMono
)

fonts_list=(
  "${essential[@]}"
  3270 Agave AnonymousPro Arimo AurulentSansMono BigBlueTerminal BitstreamVeraSansMono
  CascadiaCode CodeNewRoman Cousine DaddyTimeMono DejaVuSansMono DroidSansMono
  FantasqueSansMono FiraCode FiraMono Go-Mono Gohu Hack Hasklig HeavyData Hermit
  IBMPlexMono iA-Writer Inconsolata InconsolataGo InconsolataLGC Iosevka Lekton
  LiberationMono Monofur Monoid Mononoki MPlus Noto OpenDyslexic Overpass ProFont
  ProggyClean RobotoMono ShareTechMono SourceCodePro SpaceMono Terminus Tinos
  Ubuntu UbuntuMono VictorMono
)

[[ "${1:-}" == "--essential" ]] && fonts_list=("${essential[@]}")

# Casks don't always follow the release name
cask_name() {
  case "$1" in
    3270)            echo font-3270-nerd-font ;;
    AnonymousPro)    echo font-anonymice-nerd-font ;;
    BigBlueTerminal) echo font-bigblue-terminal-nerd-font ;;
    BitstreamVeraSansMono) echo font-bitstream-vera-sans-mono-nerd-font ;;
    CascadiaCode)    echo font-caskaydia-cove-nerd-font ;;
    DejaVuSansMono)  echo font-dejavu-sans-mono-nerd-font ;;
    Go-Mono)         echo font-go-mono-nerd-font ;;
    Gohu)            echo font-gohufont-nerd-font ;;
    Hasklig)         echo font-hasklug-nerd-font ;;
    Hermit)          echo font-hurmit-nerd-font ;;
    IBMPlexMono)     echo font-blex-mono-nerd-font ;;
    iA-Writer)       echo font-im-writing-nerd-font ;;
    InconsolataGo)   echo font-inconsolata-go-nerd-font ;;
    InconsolataLGC)  echo font-inconsolata-lgc-nerd-font ;;
    JetBrainsMono)   echo font-jetbrains-mono-nerd-font ;;
    LiberationMono)  echo font-liberation-nerd-font ;;
    Meslo)           echo font-meslo-lg-nerd-font ;;
    MPlus)           echo font-mplus-nerd-font ;;
    ProFont)         echo font-profont-nerd-font ;;
    ProggyClean)     echo font-proggy-clean-tt-nerd-font ;;
    ShareTechMono)   echo font-shure-tech-mono-nerd-font ;;
    SourceCodePro)   echo font-sauce-code-pro-nerd-font ;;
    Terminus)        echo font-terminess-ttf-nerd-font ;;
    *) echo "font-$(echo "$1" | sed -E 's/([a-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')-nerd-font" ;;
  esac
}

case "$(uname -s)" in
  Darwin)
    for font in "${fonts_list[@]}"; do
      cask="$(cask_name "$font")"
      if brew list --cask "$cask" &>/dev/null; then
        echo "   -> $cask already installed"
      else
        brew install --cask "$cask" || echo "   -> ⚠️  Couldn't install $cask"
      fi
    done
    ;;
  Linux)
    font_dir="$HOME/.local/share/fonts/NerdFonts"
    mkdir -p "$font_dir"
    tmp="$(mktemp -d)"
    trap 'rm -rf "$tmp"' EXIT
    for font in "${fonts_list[@]}"; do
      if [[ -d "$font_dir/$font" ]]; then
        echo "   -> $font already installed"
        continue
      fi
      echo "   -> Downloading $font"
      if curl -fsSL -o "$tmp/$font.tar.xz" \
          "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz"; then
        mkdir -p "$font_dir/$font"
        tar -xf "$tmp/$font.tar.xz" -C "$font_dir/$font"
      else
        echo "   -> ⚠️  Couldn't download $font"
      fi
    done
    command -v fc-cache &>/dev/null && fc-cache -f "$font_dir"
    ;;
esac
