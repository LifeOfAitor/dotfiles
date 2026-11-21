# gh (GitHub CLI)

GitHub from the terminal. In these dotfiles it's also git's credential helper (see `.gitconfig`), so `git push` works without pasting tokens anywhere.

## Account

| Command | What it does |
|---|---|
| `gh auth login` | Log in (once per machine) |
| `gh auth status` | Check whether you're logged in, and as whom |

## Repos

| Command | What it does |
|---|---|
| `gh repo list` | Your repos |
| `gh repo clone owner/repo` | Clone without typing the full URL |
| `gh repo create name --private --source . --push` | Create a GitHub repo from the current folder and push it |
| `gh repo view --web` | Open the current repo in the browser |
| `gh browse` | Same (`gh browse file.md` opens that file) |

## Pull requests

| Command | What it does |
|---|---|
| `gh pr create` | Open a PR from the current branch (asks for title and body) |
| `gh pr create --fill` | Same, using the commit messages |
| `gh pr list` | Open PRs |
| `gh pr status` | Your PRs and the ones waiting for your review |
| `gh pr checkout 12` | Check out PR 12 locally to try it |
| `gh pr view 12 --web` | Open the PR in the browser |
| `gh pr diff 12` | See the changes |
| `gh pr merge 12 --squash --delete-branch` | Merge and delete the branch |

## Issues

| Command | What it does |
|---|---|
| `gh issue list` | Open issues |
| `gh issue create` | Create an issue |
| `gh issue view 5` | View issue 5 |
| `gh issue close 5` | Close it |

## Actions and more

| Command | What it does |
|---|---|
| `gh run list` | Latest GitHub Actions runs |
| `gh run watch` | Follow the running one live |
| `gh gist create file --public` | Upload a file as a gist |
| `gh repo list --json name,updatedAt` | JSON output (pairs perfectly with `jq`) |

Reference: `gh help`, `gh pr --help`, <https://cli.github.com/manual/>.
