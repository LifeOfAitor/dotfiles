# htop and thefuck

## htop (process monitor)

`htop` shows a live view of CPU, memory and processes. Its config lives in `.config/htop/htoprc` (in the repo; htop rewrites it whenever you change a setting).

On a Mac the F keys need `fn`, so the table lists the letter equivalents too.

| Key | Letter | What it does |
|---|---|---|
| `F1` | `h` | Help |
| `F2` | `S` | Setup (columns, colours, meters) |
| `F3` | `/` | Search for a process |
| `F4` | `\` | Filter: keep only the matches |
| `F5` | `t` | Tree view (who started whom) |
| `F6` | `<` `>` | Pick the sort column |
| `F9` | `k` | Kill the process (pick a signal: `15` polite, `9` forced) |
| `F10` | `q` | Quit |

| Key | What it does |
|---|---|
| `P` / `M` / `T` | Sort by CPU / memory / time |
| `u` | Show only one user's processes |
| `Space` | Tag processes (to kill several at once) |
| `H` | Hide / show threads |
| `F` | Follow the selected process even when it moves |

```bash
htop -p 1234        # only that PID
htop -u "$USER"     # only your processes
```

## thefuck (fix the previous command)

When you mistype a command, type `fuck` on the next line and it suggests the fix.

```bash
$ git psuh
git: 'psuh' is not a git command...
$ fuck
git push [enter/↑/↓/ctrl+c]
```

| Usage | What it does |
|---|---|
| `fuck` | Suggest the fix (`Enter` accepts, arrows for other options) |
| `fuck -y` | Run the fix straight away, no questions |
| `fuck -r` | Keep fixing until the command works |

Typical saves: typos in git and brew commands, `git push` without `--set-upstream`, a command that needed `sudo`, `cd` into a misspelled folder, `mkdir` without `-p`.

Settings and custom rules live in `.config/thefuck/`. Reference: <https://github.com/nvbn/thefuck>.
