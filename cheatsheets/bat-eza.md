# bat and eza

Replacements for `cat` and `ls`, with colours and icons.

## bat (cat with highlighting)

| Command | What it does |
|---|---|
| `bat file` | Show with colours, line numbers and git changes in the margin |
| `bat -p file` | No numbers or decorations (plain) |
| `bat -r 10:20 file` | Only lines 10 to 20 |
| `bat -l json` | Force the language (handy in pipes: `curl ... \| bat -l json`) |
| `bat -A file` | Show invisible tabs, spaces and line endings |
| `bat --paging=never file` | Don't open the pager, even if it's long |
| `bat --list-themes` | See the available themes |
| `bat cheatsheets/tmux.md` | Read these cheatsheets comfortably |

If the file doesn't fit on screen it opens in `less`: `q` to quit, `/` to search.

Optional, for coloured `man` pages (in `~/.zshrc.local`):

```zsh
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
```

## eza (ls with icons)

`ls` is already `eza -a --group-directories-first --icons` (alias in `.zshrc`). For the system `ls`: `command ls`.

| Command | What it does |
|---|---|
| `ls` | Everything, hidden files included, folders first, with icons |
| `ls -l` | Long list: permissions, size, date |
| `ls -lh` | With column headers |
| `ls -l --git` | With each file's git status |
| `ls -T` | Tree (like `tree`) |
| `ls -T -L 2` | Tree, only 2 levels |
| `ls -T --git-ignore` | Tree without what git ignores (no `node_modules`, etc.) |
| `ls -l -s modified` | Sorted by date (`-r` to reverse) |
| `ls -l -s size` | Sorted by size |
| `ls -D` / `ls -f` | Only folders / only files |
| `ls -l --total-size` | Real folder sizes (slower) |

Reference: `bat --help`, `eza --help`.
