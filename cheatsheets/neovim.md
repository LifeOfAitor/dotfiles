# neovim

The editor (`$EDITOR`: `zshconfig`, `git commit` and yazi's bulk rename all open it). Its config isn't in this repo, so bring your own in `~/.config/nvim` (or start from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)).

**The fastest way to learn the basics**: `nvim +Tutor` (about 30 minutes, interactive).

## Modes

| Mode | How to get there | What for |
|---|---|---|
| Normal | `Esc` | Move and give commands (you're here most of the time) |
| Insert | `i` `a` `o` | Type text |
| Visual | `v` `V` `Ctrl+v` | Select (characters / lines / block) |
| Command | `:` | Save, quit, search and replace... |

## Quitting (first things first)

| Command | What it does |
|---|---|
| `:w` | Save |
| `:q` | Quit |
| `:wq` or `ZZ` | Save and quit |
| `:q!` | Quit without saving |

## Moving (normal mode)

| Key | What it does |
|---|---|
| `h` `j` `k` `l` | Left, down, up, right |
| `w` / `b` / `e` | Next word / previous word / end of word |
| `0` / `^` / `$` | Start of line / first character / end |
| `gg` / `G` / `42G` | Top / bottom of the file / line 42 |
| `Ctrl+d` / `Ctrl+u` | Half page down / up |
| `%` | Jump to the matching bracket |
| `f x` | Jump to the next `x` on the line (`;` repeats) |

## Starting to type

| Key | Where typing starts |
|---|---|
| `i` / `a` | Before / after the cursor |
| `I` / `A` | Start / end of the line |
| `o` / `O` | New line below / above |

## Editing

| Key | What it does |
|---|---|
| `x` | Delete a character |
| `dd` / `yy` / `p` | Cut line / copy line / paste |
| `dw` / `cw` | Delete word / change word |
| `ciw` / `ci"` / `ci(` | Change the word / what's inside quotes / inside brackets |
| `u` / `Ctrl+r` | Undo / redo |
| `.` | Repeat the last change |
| `>>` / `<<` | Indent / unindent |

The grammar is **verb + motion**: `d` (delete), `c` (change), `y` (yank) + `w`, `$`, `iw`, `}`... That's why `d$` deletes to the end of the line and `y3j` copies this line and the next 3.

## Search and replace

| Command | What it does |
|---|---|
| `/text` | Search down (`n` next, `N` previous) |
| `*` | Search for the word under the cursor |
| `:%s/old/new/g` | Replace in the whole file |
| `:%s/old/new/gc` | Same, asking each time |
| `:noh` | Clear search highlighting |

## Files and splits

| Command | What it does |
|---|---|
| `:e path` | Open a file |
| `:sp` / `:vs` | Split horizontally / vertically |
| `Ctrl+w` then `h` `j` `k` `l` | Move between splits |
| `:Ex` | Built-in file explorer |

Reference: `:help` inside nvim, and `:help quickref` for the official cheatsheet.
