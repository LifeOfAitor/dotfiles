# ripgrep (`rg`) and fd

The modern replacements for `grep` and `find`. Much faster, and by default they **skip whatever is in `.gitignore`, hidden files and binaries**, which is usually what you want. yazi uses them under the hood (`S` and `s`).

- `rg` searches **inside** files (content).
- `fd` searches file **names**.

## ripgrep: search text

| Command | What it does |
|---|---|
| `rg text` | Search the current folder and subfolders |
| `rg text path/` | Search only that path |
| `rg -i text` | Case-insensitive |
| `rg -S text` | Case-sensitive only if you type an uppercase letter |
| `rg -w text` | Whole word |
| `rg -F 'a.b(c)'` | Literal text (no regex) |
| `rg -l text` | Only the names of matching files |
| `rg -c text` | Number of matches per file |
| `rg -C 3 text` | With 3 lines of context (`-A` after, `-B` before) |
| `rg -t py text` | Only one file type (`rg --type-list` lists them) |
| `rg -g '*.md' text` | Only files matching the glob (`-g '!*.lock'` to exclude) |
| `rg --hidden text` | Include hidden files |
| `rg -uu text` | Include hidden and ignored files (search everything) |
| `rg --files` | List the files it would search |

```bash
rg 'TODO|FIXME'                       # regex: one or the other
rg -i 'alias' ~/dotfiles              # where are aliases defined
rg -l 'catppuccin' | xargs nvim       # open every file that mentions it
```

## fd: find files

| Command | What it does |
|---|---|
| `fd tmux` | Files and folders whose name contains "tmux" |
| `fd tmux path/` | Search in that path |
| `fd -e md` | By extension |
| `fd -t f` / `fd -t d` | Only files / only folders |
| `fd -H name` | Include hidden files (e.g. `fd -H zshrc`) |
| `fd -I name` | Include files ignored by `.gitignore` |
| `fd -d 2 name` | At most 2 levels deep |
| `fd -g '*.conf'` | Glob instead of regex |
| `fd --changed-within 1d` | Modified in the last day |
| `fd -S +100m` | Larger than 100 MB |
| `fd -e png -x convert {} {.}.jpg` | Run a command for each result |
| `fd -e md -X bat` | Run one command with all the results |

In `-x`: `{}` is the path, `{.}` without extension, `{/}` just the name, `{//}` the folder.

Reference: `rg --help`, `fd --help`.
