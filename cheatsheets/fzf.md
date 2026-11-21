# fzf

A fuzzy finder: give it a list (files, history, git branches, anything), type a few letters and it filters instantly. Works on its own or built into the shell.

`.zshrc` loads it for you, using `fd` to list files (fast, respects `.gitignore`) and `bat` for the preview.

## Shell shortcuts

| Shortcut | What it does |
|---|---|
| `Ctrl+R` | **Search your command history**. The most useful one by far |
| `Ctrl+T` | Pick files and paste their paths into the current line |
| `Alt+C` | Pick a folder and `cd` into it (see the macOS note below) |
| `command **` + `Tab` | fzf completion: `nvim **<Tab>`, `cd **<Tab>`, `kill -9 **<Tab>`, `ssh **<Tab>` |

**macOS note**: `Alt+C` needs Option to act as Alt, and on many non-US keyboard layouts Option is how you type `@`, `#`, `[`... Use `cd **<Tab>` or zoxide's `z` / `zi` instead.

## Inside fzf

| Key | What it does |
|---|---|
| `Ctrl+j` / `Ctrl+k` (or arrows) | Down / up |
| `Enter` | Accept |
| `Esc` / `Ctrl+c` | Cancel |
| `Tab` / `Shift+Tab` | Mark several (in `Ctrl+T` and with `fzf -m`) |

## Search syntax

| You type | It matches |
|---|---|
| `tmux` | Fuzzy: t...m...u...x |
| `'tmux` | Exactly "tmux" |
| `^conf` | Starts with "conf" |
| `.md$` | Ends with ".md" |
| `!test` | Doesn't contain "test" |
| `md$ \| txt$` | Ends with .md or .txt |
| `dotf md$` | Several terms = all of them (AND) |

## One-liners

```bash
nvim $(fzf)                                   # open a file by picking it
fzf --preview 'bat --color=always {}'         # with a preview
git switch $(git branch | fzf)                # switch branch by picking it
brew list | fzf                               # search what's installed
history | fzf                                 # Ctrl+R, by hand
```

Reference: `man fzf` and <https://github.com/junegunn/fzf>.
