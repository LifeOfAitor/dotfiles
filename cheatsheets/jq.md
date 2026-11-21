# jq

Read, filter and transform JSON from the terminal. Feed it JSON (a file or a pipe) and a filter in single quotes.

```bash
jq '.' data.json               # pretty-print with colours
curl -s https://api.github.com/users/octocat | jq '.public_repos'
```

## Basic filters

| Filter | What it returns |
|---|---|
| `.` | Everything, nicely formatted |
| `.name` | The `name` field |
| `.user.email` | A nested field |
| `.[0]` / `.[-1]` | First / last element of an array |
| `.[]` | Each array element, one by one |
| `.[].name` | The `name` field of each element |
| `.[2:5]` | Elements 2 to 4 |
| `.field?` | No error if the field doesn't exist |

## Transforming

| Filter | What it does |
|---|---|
| `.[] \| {name, id}` | Keep only those fields |
| `.[] \| select(.age > 30)` | Filter by a condition |
| `.[] \| select(.name \| test("ann"; "i"))` | Filter by regex (case-insensitive) |
| `map(.price)` | Array of just the prices |
| `map(.price) \| add` | Sum them |
| `length` | Length of an array or object |
| `keys` | Keys of an object |
| `sort_by(.date)` / `group_by(.type)` | Sort / group |
| `unique_by(.id)` | Remove duplicates |
| `to_entries` | `{a:1}` becomes `[{key:"a", value:1}]` |
| `.a // "default"` | Fallback if `.a` is null |

## Useful options

| Option | What it does |
|---|---|
| `-r` | Raw text without quotes (for scripts) |
| `-c` | One line per result |
| `-s` | Slurp several inputs into one array |
| `--arg n value` | Pass a variable: `jq --arg n "$USER" '.[] \| select(.user == $n)'` |
| `-n` | No input, to build JSON: `jq -n '{a: 1}'` |

```bash
gh repo list --json name,updatedAt | jq -r '.[].name'     # names of your repos
jq -r '.[] | "\(.name): \(.price)"' products.json         # formatted text
jq '.version = "2.0"' package.json > tmp && mv tmp package.json   # change a field
```

Try filters with visual feedback: <https://jqplay.org>. Manual: <https://jqlang.org/manual/>.
