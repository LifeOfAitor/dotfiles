# tmux

A terminal multiplexer: inside a single kitty window you get **sessions**, each session has **windows** (like tabs) and each window splits into **panes**. The point is that a session stays alive when you close kitty or an SSH connection drops: you attach again later and everything is where you left it.

```
session "work"
 ├── window 1: editor   -> [ nvim | shell ]   (2 panes)
 ├── window 2: logs
 └── window 3: git
```

**Why, if kitty already has tabs and splits?** For two things kitty can't do: leave processes running and come back later (detach/attach), and work on a server over SSH without losing anything if the connection drops.

## The prefix

Almost everything starts with the **prefix** `Ctrl+b`, **release**, then the key. In this cheatsheet `P` = `Ctrl+b`.

`P c` = press `Ctrl+b`, release, press `c`.

Lost? `P ?` lists every binding (`q` to leave).

## From the shell (outside tmux)

| Command | What it does |
|---|---|
| `tmux` | New unnamed session |
| `tmux new -s work` | New session called `work` |
| `tmux ls` | List sessions |
| `tmux a` | Attach to the last session |
| `tmux a -t work` | Attach to `work` |
| `tmux kill-session -t work` | Close the `work` session |
| `tmux kill-server` | Close every session |

## Sessions

| Key | What it does |
|---|---|
| `P d` | **Leave without closing** (detach). The session keeps running |
| `P s` | Session list to jump between them |
| `P $` | Rename the session |
| `P (` / `P )` | Previous / next session |

## Windows

| Key | What it does |
|---|---|
| `P c` | New window |
| `P ,` | Rename window |
| `P 1` ... `P 9` | Go to window N |
| `P n` / `P p` | Next / previous window |
| `P w` | Tree of every session and window (with preview) |
| `P &` | Close window (asks first) |

## Panes

| Key | What it does |
|---|---|
| `P \|` | Split: new pane to the right (*this config*) |
| `P -` | Split: new pane below (*this config*) |
| `P %` / `P "` | Same thing with the default keys |
| `P arrows` | Move between panes (or click) |
| `P z` | **Zoom**: the pane fills the window. Press again to go back |
| `P x` | Close pane (or just `exit` / `q`) |
| `P q` | Show pane numbers; press one to jump there |
| `P Space` | Cycle through preset layouts |
| `P {` / `P }` | Swap with the previous / next pane |
| `P !` | Break the pane out into its own window |
| `P Ctrl+arrows` | Resize (or drag the border) |

## Copy mode (scroll and copy text)

The mouse wheel takes you straight in. From the keyboard:

| Key | What it does |
|---|---|
| `P [` | Enter copy mode |
| `j` `k` / `Ctrl+u` `Ctrl+d` | Move by line / half page |
| `/text` `?text` | Search down / up (`n` for next) |
| `v` | Start selection (*this config*) |
| `Ctrl+v` | Block selection (*this config*) |
| `y` | Copy to the clipboard and exit (*this config*) |
| `q` | Leave copy mode |

## Other

| Key | What it does |
|---|---|
| `P r` | Reload `~/.tmux.conf` (*this config*) |
| `P :` | tmux command prompt (e.g. `:kill-session`) |
| `P t` | Big clock (yes, mostly useless) |

## Example workflow

```bash
tmux new -s dotfiles        # create the session
nvim README.md              # edit in the first pane
# P |                       -> pane on the right for a shell
# P z                       -> zoom into the editor when you need room
# P c                       -> another window for something long-running
# P d                       -> walk away; everything keeps running

tmux a -t dotfiles          # tomorrow: come back and it's all still there
```

Same over SSH: `ssh server`, `tmux new -s something`, start whatever, `P d`, disconnect. Later: `ssh server` + `tmux a`.

Idea: a quiet corner that grows while you work, with `tmux split-window -h -l 32 'txoko --work'` (see [txoko.md](txoko.md)).

## This config (`.tmux.conf`)

Linked by `scripts/link.sh`. What it changes from the defaults:

- Mouse on: click to pick a pane, drag borders, scroll.
- Windows and panes start at 1, and renumber when one closes.
- `P |` and `P -` to split; every new split and window opens in the current folder.
- `P r` reloads the config.
- Copy mode with vim keys (`v`, `y`), copying to the system clipboard.
- Status bar at the top in Catppuccin Frappé, and no slow `Esc` in nvim.

The prefix is still `Ctrl+b`, so any tmux cheatsheet online works the same.

Reference: `man tmux` and <https://tmuxcheatsheet.com>.
