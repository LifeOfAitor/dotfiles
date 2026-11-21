# kitty

The terminal. GPU-accelerated, with its own tabs and splits, inline images, and configured in `~/.config/kitty/kitty.conf` (in the repo).

In kitty, `kitty_mod` = `Ctrl+Shift` on both macOS and Linux. On macOS the usual `Cmd` shortcuts work as well.

## Tabs and windows

In kitty, a "window" is a split inside a tab.

| Shortcut | Also on macOS | What it does |
|---|---|---|
| `Ctrl+Shift+T` | `Cmd+T` | New tab (*mapped in this config*) |
| `Ctrl+Shift+←` / `→` | `Cmd+Shift+[` / `]` | Previous / next tab (*this config*) |
| `Ctrl+Shift+Q` | `Cmd+W` | Close tab |
| `Ctrl+Shift+Alt+T` | | Rename tab |
| `Ctrl+Shift+.` / `,` | | Move tab right / left |
| | `Cmd+1` ... `Cmd+9` | Go to tab N |
| `Ctrl+Shift+Enter` | `Cmd+Enter` | New window (split) in the tab (*this config*) |
| `Ctrl+Shift+W` | | Close window (*this config*) |
| `Ctrl+Shift+]` / `[` | | Next / previous window |
| `Ctrl+Shift+L` | | Cycle window layouts |
| `Ctrl+Shift+R` | | Resize the current window |

## Scrolling and output

| Shortcut | What it does |
|---|---|
| `Ctrl+Shift+↑` / `↓` | Scroll line by line |
| `Ctrl+Shift+Z` / `X` | Jump to the previous / next prompt (thanks to `shell_integration`) |
| `Ctrl+Shift+G` | Open the last command's output in the pager |
| `Ctrl+Shift+H` | Open the whole scrollback in the pager (`less`; search with `/`) |

## Text, font and looks

| Shortcut | Also on macOS | What it does |
|---|---|---|
| `Ctrl+Shift+C` / `V` | `Cmd+C` / `V` | Copy / paste |
| `Ctrl+Shift+=` / `-` | `Cmd++` / `Cmd+-` | Bigger / smaller font |
| `Ctrl+Shift+Backspace` | `Cmd+0` | Reset font size |
| `Ctrl+Shift+A` then `M` / `L` | | More / less opacity (`dynamic_background_opacity` is on) |
| `Ctrl+Shift+A` then `D` | | Default opacity |
| `Ctrl+Shift+E` | | Pick a URL on screen and open it |
| `Ctrl+Shift+U` | | Type a Unicode character by name |

## Config

| Shortcut | macOS | What it does |
|---|---|---|
| `Ctrl+Shift+F2` | `Cmd+,` | Open `kitty.conf` |
| `Ctrl+Shift+F5` | `Ctrl+Cmd+,` | Reload the config |

## Kittens (bundled mini-programs)

```bash
kitten themes                 # switch theme with a live preview (writes current-theme.conf)
kitten icat photo.png         # show an image in the terminal
kitten ssh server             # ssh that brings kitty's shell integration along
kitten diff a.txt b.txt       # coloured side-by-side diff
kitten choose-fonts           # pick a font with a preview
```

## This config at a glance

MesloLGLDZ Nerd Font at 12, 0.90 opacity with blur, powerline-style slanted tabs at the bottom, a blinking block cursor, 5000 lines of scrollback, `allow_remote_control yes`, and the Catppuccin Frappé theme in `current-theme.conf`.

Reference: <https://sw.kovidgoyal.net/kitty/overview/> and <https://sw.kovidgoyal.net/kitty/actions/>.
