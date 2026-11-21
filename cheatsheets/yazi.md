# yazi

A file manager in the terminal, with previews for images, video, PDFs and archives (handled by `ffmpeg`, `imagemagick`, `poppler`, `sevenzip`... from the Brewfile). Three columns: parent folder, current folder and preview.

**Open it with `y`** (not `yazi`): it's a function in `.zshrc` that, when you quit with `q`, leaves your shell in the folder you were in inside yazi. `Q` quits without changing folder.

Lost? `~` or `F1` opens the help (type to filter).

## Moving around

| Key | What it does |
|---|---|
| `j` / `k` (or arrows) | Down / up |
| `h` / `l` | Parent folder / enter folder |
| `gg` / `G` | Top / bottom of the list |
| `Ctrl+d` / `Ctrl+u` | Half page down / up |
| `H` / `L` | Back / forward in folder history |
| `J` / `K` | Scroll the preview (PDFs, long text) |
| `T` | Maximise / restore the preview (toggle-pane plugin) |
| `Tab` | File info (MIME type, etc.) |

## Going places

| Key | What it does |
|---|---|
| `gh` | Home |
| `gc` | `~/.config` |
| `gd` | `~/Downloads` |
| `gt` | Trash |
| `g Space` | Type a path |
| `gf` | Follow the symlink (handy in these dotfiles) |
| `z` | Jump to a file or folder with **fzf** |
| `Z` | Jump to a folder with **zoxide** (the ones you use most) |

## Opening

| Key | What it does |
|---|---|
| `Enter` / `o` | Open with the default app |
| `O` | Choose what to open it with |

## Selecting

| Key | What it does |
|---|---|
| `Space` | Mark / unmark the file |
| `v` | Visual mode: select as you move |
| `Ctrl+a` | Select all |
| `Ctrl+r` | Invert selection |
| `Esc` | Clear selection / cancel |

## File operations

| Key | What it does |
|---|---|
| `y` | Copy (yank) |
| `x` | Cut |
| `p` | Paste |
| `P` | Paste, overwriting |
| `Y` / `X` | Cancel copy / cut |
| `d` | Move to trash |
| `D` | **Delete permanently** |
| `a` | Create a file; end it with `/` for a folder (`notes/`) |
| `r` | Rename (with several selected, bulk-renames in nvim) |
| `-` | Symlink what you copied |
| `.` | Show / hide hidden files (shown by default here) |

## Search and filter

| Key | What it does |
|---|---|
| `f` | Filter the current folder as you type |
| `/` / `?` | Find a file down / up (`n` / `N` for next) |
| `s` | Search by name in subfolders (uses `fd`) |
| `S` | Search by content (uses `ripgrep`) |
| `Ctrl+s` | Cancel the search |

## Copy paths to the clipboard

| Key | What it copies |
|---|---|
| `cc` | Full file path |
| `cd` | Folder path |
| `cf` | File name |
| `cn` | Name without extension |

## Sorting and view

| Key | What it does |
|---|---|
| `,m` / `,M` | By modification date (normal / reversed) |
| `,n` | Natural sort (`2.md` before `10.md`); **the default here** |
| `,s` / `,S` | By size |
| `,e` | By extension |
| `ms` / `mm` / `mp` | Show next to each file: size / date / permissions (`mn` for none); **size by default** |

These only change the current session; reopening yazi goes back to `yazi.toml`.

## Tabs, tasks and shell

| Key | What it does |
|---|---|
| `tt` | New tab in the current folder |
| `1` ... `9` | Go to tab N |
| `[` / `]` | Previous / next tab |
| `Ctrl+c` | Close tab (or quit if it's the last one) |
| `w` | Task manager (long copies, etc.) |
| `;` | Run a command in the current folder |
| `:` | Run a command and wait for it to finish |

## Example workflow

```
y              open
Z dotfiles     jump to the dotfiles folder
s tmux         find files with "tmux" in the name
Space x2       mark two
y              copy
gd             go to Downloads
p              paste
q              quit, and the shell stays in Downloads
```

## This config

Only what differs from the defaults is kept in the repo:

| File | What it changes |
|---|---|
| `yazi.toml` | Hidden files shown · columns `ratio = [1, 3, 4]` (the preview is the widest; default `[1, 4, 3]`) · natural sort · size next to each file · wrapped preview lines · images up to 1200×1800 |
| `theme.toml` | Catppuccin Frappé theme |
| `init.lua` | Sets up the plugins (rounded borders, git, mdv theme) |
| `keymap.toml` | `T` to maximise the preview |

If the preview feels small, try `ratio = [1, 2, 5]`. To add a binding, put just yours in `.config/yazi/keymap.toml` (yazi supplies the defaults):

```toml
[[mgr.prepend_keymap]]
on   = "!"
run  = 'shell "$SHELL" --block'
desc = "Open a shell here"
```

## Plugins

Install them with `ya pkg add user/plugin`: that records them in `package.toml`, and the `git pull` hook installs them on your other machines. **Don't `git clone`** inside `~/.config/yazi`: it's a symlink into the dotfiles repo, so you'd end up with a repo inside a repo.

| Command | What it does |
|---|---|
| `ya pkg list` | Installed plugins and flavors |
| `ya pkg add user/plugin` | Install |
| `ya pkg upgrade` | Upgrade everything |
| `ya pkg delete user/plugin` | Uninstall |

Installed:

| Plugin | What it does | Configured in |
|---|---|---|
| **mdv-previewer** | Rendered Markdown preview (needs `mdv`) | `yazi.toml` + `init.lua` |
| **toggle-pane** | `T` maximises / restores the preview | `keymap.toml` |
| **git** | Git status next to each file inside a repo (modified, untracked, ignored…) | `yazi.toml` (fetchers) + `init.lua` |
| **full-border** | Rounded borders around the three columns | `init.lua` |

Full default keymap: <https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/keymap-default.toml>
