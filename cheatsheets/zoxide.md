# zoxide

A `cd` that learns. Every folder you visit gets a score (how often + how recently), and then you jump there from anywhere by typing part of its name.

`.zshrc` loads it as the very last thing (zoxide asks for that). It starts knowing nothing and learns as you use `cd` and `z`. It also powers `Z` in yazi.

## Usage

| Command | What it does |
|---|---|
| `z dotfiles` | Jump to the best-scoring folder that contains "dotfiles" |
| `z dot che` | Several words, in order: something like `.../dotfiles/cheatsheets` |
| `zi` | Pick from the list with fzf (interactive) |
| `zi notes` | Same, already filtered by "notes" |
| `z -` | Back to the previous folder |
| `z ..` / `z ~/path` | Normal paths work too, like `cd` |
| `z foo` + `Space` + `Tab` | See the matches in fzf before jumping |

## Maintenance

| Command | What it does |
|---|---|
| `zoxide query dot` | Where `z dot` would go, without jumping |
| `zoxide query -ls` | Full list with scores |
| `zoxide add ~/path` | Add a folder by hand |
| `zoxide remove ~/path` | Forget a folder |

## Optional: replace `cd`

If you'd rather not learn a new command, change the line in `.zshrc` to `eval "$(zoxide init zsh --cmd cd)"`: `cd` becomes zoxide (and `cdi` the interactive one). Normal paths keep working.

Reference: <https://github.com/ajeetdsouza/zoxide>.
