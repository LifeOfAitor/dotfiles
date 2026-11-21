# Cheatsheets

Short, practical guides for every tool in the `Brewfile`. Read them from the terminal with `cheat` (alias for `bat ~/dotfiles/cheatsheets/README.md`) or `bat ~/dotfiles/cheatsheets/tmux.md`.

Each one follows the same shape: what it is, how to start, a table of keys and commands, and a real example.

## Tools

| Tool | What it's for | Cheatsheet |
|---|---|---|
| tmux | Sessions, windows and panes that survive closing the terminal | [tmux.md](tmux.md) |
| yazi | File manager in the terminal (`y`) | [yazi.md](yazi.md) |
| fzf | Fuzzy finder: history, files, any list | [fzf.md](fzf.md) |
| zoxide | A smarter `cd` (`z`, `zi`) | [zoxide.md](zoxide.md) |
| zsh | The aliases, line-editing shortcuts and git aliases | [zsh.md](zsh.md) |
| kitty | The terminal: tabs, splits, kittens | [kitty.md](kitty.md) |
| neovim | The editor | [neovim.md](neovim.md) |
| ripgrep / fd | Search inside files / search for files | [ripgrep-fd.md](ripgrep-fd.md) |
| jq | Read and transform JSON | [jq.md](jq.md) |
| bat / eza | `cat` with colours / `ls` with icons | [bat-eza.md](bat-eza.md) |
| gh | GitHub from the terminal | [gh.md](gh.md) |
| htop / thefuck | Process monitor / fix the last command | [htop-thefuck.md](htop-thefuck.md) |
| docker | Containers | [docker.md](docker.md) |
| cliamp | Music in the terminal: YouTube, radio, podcasts, local files | [cliamp.md](cliamp.md) |
| txoko | A bonsai that grows with your commits, pomodoros and screen time | [txoko.md](txoko.md) |

## Work on their own (nothing to learn)

- **zsh-autosuggestions**, **zsh-syntax-highlighting**, **Powerlevel10k**: you see them as you type.
- **tree**: `tree` or `tree -L 2` (or `ls -T`).
- **neofetch**: system info next to an ASCII cat, shown when a terminal opens.
- **git**: the usual (its aliases are in [zsh.md](zsh.md)).

## Dependencies (here for something else)

- **yazi previews**: `ffmpeg`, `ffmpegthumbnailer`, `imagemagick`, `poppler`, `resvg`, `sevenzip`, and `rust` to build `mdv`.

## Keeping this up to date

When you install something new, add it to the `Brewfile` (`pushdf` reminds you if you forget) and, if it's worth it, write a cheatsheet here with the same structure.
