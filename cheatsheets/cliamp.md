# cliamp

A music player in the terminal with a Winamp feel: local files, internet radio, podcasts, YouTube, YouTube Music, SoundCloud, Spotify and more, with a visualiser and an equaliser.

Lost? `Ctrl+K` (or `?`) lists every shortcut for the screen you're on, and `/` filters them.

## Requirements

YouTube, YouTube Music and SoundCloud need **yt-dlp** (and **ffmpeg** for some formats):

```bash
brew install yt-dlp ffmpeg
yt-dlp -U        # if YouTube stops working, it's almost always an outdated yt-dlp
```

## How YouTube works

There are two ways to use it, and they're easy to mix up:

**1. No account: search and play.** Works with zero setup.

| How | What it does |
|---|---|
| `cliamp search "daft punk"` | Search YouTube from the shell and play it |
| `Ctrl+F` in the player | Search the active provider; if it has no search, searches YouTube |
| `u` in the player | Paste a YouTube URL (video or playlist) |
| `cliamp 'https://www.youtube.com/watch?v=...'` | Play a URL directly |

A URL with `list=` loads the whole playlist. For just the video: `cliamp --no-expand-playlist 'URL'`.

**2. With your account: your playlists and likes.** The YouTube / YouTube Music provider only shows **your saved lists**, so it's empty until you sign in. The easy way is to reuse your browser's session. In `~/.config/cliamp/config.toml`:

```toml
[ytmusic]
cookies_from = "chrome"    # or safari, firefox, brave, edge...
```

(or run `cliamp setup` and pick YouTube Music). You need to be signed in to YouTube in that browser. On macOS, the first time it may ask for keychain access (Chrome) or Full Disk Access for the terminal (Safari).

Then: `Y` opens YouTube (everything), `Y` again for YouTube only, again for YouTube Music. Pick a playlist with `j` `k` and load it with `Enter`. `Ctrl+R` refreshes the lists.

## Playback

| Key | What it does |
|---|---|
| `Space` | Play / pause |
| `s` | Stop |
| `>` or `.` / `<` or `,` | Next / previous |
| `←` `→` | Back / forward 5 s |
| `Shift+←` `Shift+→` | Back / forward 30 s |
| `7j` | Jump to 70 % of the track (`0j` to the start) |
| `Ctrl+J` | Jump to a specific time |
| `+` `-` | Volume |
| `z` | Shuffle |
| `r` | Repeat: off / all / one |

## Playlist and queue

| Key | What it does |
|---|---|
| `j` `k` / arrows | Move through the list |
| `Enter` | Play the selected track |
| `/` | Filter the list |
| `a` | Add to the queue (plays next) |
| `A` | Queue manager |
| `x` | Remove the track from the list |
| `f` | Favourite (local "Favorites" playlist; doesn't like it on YouTube) |
| `w` | Save the track to a local playlist |
| `Ctrl+S` | Download the track to `~/Music/cliamp` |
| `Ctrl+X` | Expand / shrink the playlist |
| `o` | File browser |
| `Esc` or `b` | Back to the provider list |

## Providers (sources)

| Key | Opens |
|---|---|
| `Y` | YouTube / YouTube Music |
| `R` | Internet radio (about 58,000 stations; `N` by country, `/` to search) |
| `O` | Podcasts (`/` to search, `f` to subscribe) |
| `L` | Local files |
| `C` | SoundCloud |
| `S` | Spotify (set it up with `cliamp setup`) |

## Looks and extras

| Key | What it does |
|---|---|
| `t` | Pick a theme |
| `v` / `V` | Switch visualiser / full-screen visualiser |
| `e` | Equaliser presets |
| `y` | Lyrics |
| `d` | Pick the audio output device |
| `Tab` | Move through the controls (source, volume, EQ, shuffle...) |
| `Ctrl+B` | Show / hide the settings panel |
| `q` | Quit |

## From the shell

```bash
cliamp ~/Music                 # play a folder
cliamp --provider radio        # start straight in the radio
cliamp --provider ytmusic      # start in YouTube Music
cliamp toggle                  # play/pause the cliamp that's already open
cliamp next                    # next track
cliamp upgrade                 # update cliamp
```

Idea: open it in a tmux window and leave it playing with `P d`.

Reference: <https://github.com/bjarneo/cliamp> (the `docs/` folder).
