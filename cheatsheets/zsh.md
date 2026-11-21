# zsh

zsh with Oh My Zsh and the Powerlevel10k prompt. Plugins: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `fast-syntax-highlighting` and `zsh-autocomplete`.

## Aliases and functions

| Command | What it does |
|---|---|
| `y` | Open yazi; quitting with `q` leaves you in its folder |
| `ls` | `eza -a --group-directories-first --icons` (the original: `command ls`) |
| `z` / `zi` | Jump to a folder with zoxide |
| `pushdf` | Push your dotfiles (pulls first, warns about new packages, asks for a message) |
| `pulldf` | Pull your dotfiles from another machine |
| `cheat` | Open the cheatsheet index |
| `zshconfig` / `ohmyzsh` | Edit `.zshrc` / Oh My Zsh in nvim |
| `q` | `exit` |
| `fuck` | Fix the last command (thefuck) |
| `icloud` | Go to your iCloud Drive folder (macOS only) |

Settings for a single machine go in `~/.zshrc.local` (not in the repo).

## Typing faster

| Shortcut | What it does |
|---|---|
| `→` or `End` | Accept the grey suggestion (it comes from your history) |
| `Tab` / arrows | Move through the autocomplete menu that pops up |
| `Ctrl+R` | Search history (with fzf) |
| `Ctrl+A` / `Ctrl+E` | Start / end of the line |
| `Ctrl+U` / `Ctrl+K` | Delete to the start / to the end |
| `Ctrl+W` | Delete the previous word |
| `Ctrl+L` | Clear the screen |
| `!!` | The previous command (`sudo !!` reruns it with sudo) |
| `cd -` | Back to the previous folder |

Syntax highlighting turns the command **red** if it doesn't exist and **green** if it does, before you hit Enter.

## Git aliases (Oh My Zsh `git` plugin)

| Alias | Same as |
|---|---|
| `gst` | `git status` |
| `ga` / `gaa` | `git add` / `git add --all` |
| `gcmsg "message"` | `git commit -m "message"` |
| `gp` / `gl` | `git push` / `git pull` |
| `gd` | `git diff` |
| `gsw branch` / `gswc branch` | `git switch` / `git switch -c` (new branch) |
| `gco` | `git checkout` |
| `glog` | One-line log with a branch graph |
| `gsta` / `gstp` | `git stash` / `git stash pop` |

See them all: `alias | rg '^g'`.
