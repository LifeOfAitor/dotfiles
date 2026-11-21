# txoko

A bonsai in your terminal that **actually grows**, branch by branch: by hand, with your commits, with your pomodoros or with the time you spend at the computer. It changes with the seasons, and at night the moon comes out. Source: <https://github.com/LifeOfAitor/txoko>.

Lost? The keys are always listed at the bottom of the screen, and `txoko --help` shows every command.

## Getting started

```bash
txoko                       # the bonsai, grow it by hand with + and -
txoko hook install          # once: every commit makes it grow
txoko daemon install        # once: time at the computer counts too
txoko --work                # watch it grow with your real activity
```

## Keys

| Key | What it does |
|---|---|
| `+` `-` | Grow / shrink (not with `--work`) |
| `s` | Next scene: bonsai, island, arch, garden |
| `e` | Change season: spring → summer → autumn → winter → today's |
| `n` | Day / night (follows the clock until you press it) |
| `r` | Plant another tree (new seed) |
| `Space` | Pause the animation |
| `q` | Quit |

## Commands

| Command | What it does |
|---|---|
| `txoko --scene island` | Start in another scene (`bonsai`, `island`, `arch`, `garden`) |
| `txoko --season winter --sky night` | Force a season and night, whatever the date |
| `txoko --pomodoro 25 --break 5` | Pomodoro: a new tree blossoms while you focus |
| `txoko --once --work` | Print the scene once with your stats beside it, neofetch-style |
| `txoko status` | One line for tmux or your prompt: `🍂 77% · 2d` |
| `txoko stats` | Growth, today's commits, focus, active time and streak |
| `txoko snap -o bonsai.svg` | Save the scene as an SVG image |
| `txoko import ~/code/*` | Import commits from the last 30 days (`--days 90` for more) |
| `txoko hook status` / `uninstall` | Is the commit hook installed? / remove it |
| `txoko daemon status` / `uninstall` | Is it counting screen time? / remove it |
| `txoko config init` | Create `~/.config/txoko/config.toml` with every option explained |

Flags that work almost everywhere: `--scene`, `--season`, `--sky day|night`, `--growth 0..1`, `--seed N`, `--work`, `--size WxH` (`--once` and `snap`).

## How `--work` grows

| What | Points |
|---|---|
| One commit | 1 |
| A finished 25-minute pomodoro | 1 |
| One hour at the computer (with the daemon) | 1 |

Points halve every two weeks: take a few days off and the tree thins out, but it never dies.

Heads-up: repos with their own `core.hooksPath` (like this one, which uses `.githooks`) skip the global hook. Bring their commits in with `txoko import ~/dotfiles`.

## Real examples

```bash
# A tmux corner that grows while you work
tmux split-window -h -l 32 'txoko --work'

# The tmux status line, with a custom format
txoko status --format '{icon} {bar} {today}c {active}'   # 🍂 ▰▰▰▰▱ 3c 2h10

# Today's picture, to share
txoko snap --work --sky night -o today.svg && open today.svg

# Update
brew upgrade txoko
```

Your data lives in `~/.local/share/txoko/txoko.db`, and only the repo name, commit hash, time and active minutes are stored.
