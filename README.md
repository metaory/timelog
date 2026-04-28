<div align="center">
    <img src=".github/logo.svg" alt="" width="180" height="180" />
    <h1>timelog</h1>
    <p>Minimal Bash TUI for timestamped terminal logs.</p>
</div>

## Description

`timelog` is a single Bash script that logs lines as `index  time  ::  text` in a full-screen terminal loop. Time column modes: `clock` (`HH:MM:SS`), `lap` (`+HH:MM:SS` since previous line), and `total` (`+HH:MM:SS` since first line).

Interactive mode (TTY) reads keys directly, supports **Ctrl+S** to save entries to `./<epoch>.log`, and restores terminal state on exit/signals. Non-interactive mode (piped stdin) falls back to line reads and skips hotkey setup.

## Demos

<div align="center">
  <p><strong>Clock (--clock)</strong></p>
  <img src=".github/demos/clock.gif" alt="timelog clock mode demo" width="80%" />
  <hr>
  <p><strong>Lap (--lap)</strong></p>
  <img src=".github/demos/lap.gif" alt="timelog lap mode demo" width="80%" />
  <hr>
  <p><strong>Total (--total)</strong></p>
  <img src=".github/demos/total.gif" alt="timelog total mode demo" width="80%" />
</div>

## Usage

```bash
bash timelog
bash timelog --clock    # same as no args (wall-clock hour:minute:second per line)
bash timelog --lap      # delta since previous line (+HH:MM:SS), first line +00:00:00
bash timelog --total    # elapsed since first line (+HH:MM:SS), first line +00:00:00
# shorts: -c (clock), -l (lap), -t (total)
```

### Modes

- `clock`: records the current wall-clock time for each entry.
- `lap`: records the time passed since the previous entry.
- `total`: records total elapsed time since the first entry.

Examples:

`clock` (wall time on each line)

- `1  09:00:02 :: Open project` - real clock when you wrote entry 1.
- `2  09:02:18 :: Run tests` - later clock time for entry 2.
- `3  09:05:41 :: Commit fix` - current clock time again for entry 3.

`lap` (time since previous line)

- `1  +00:00:00 :: Open project` - first entry always starts at zero.
- `2  +00:02:16 :: Run tests` - took 2m16s after previous entry.
- `3  +00:03:23 :: Commit fix` - took 3m23s since entry 2.

`total` (time since first line)

- `1  +00:00:00 :: Open project` - first entry starts elapsed timer.
- `2  +00:02:16 :: Run tests` - total elapsed since entry 1.
- `3  +00:05:39 :: Commit fix` - cumulative elapsed from the start.

Type a line and press **Enter**. Each entry is recorded as `index  time  ::  text` and the screen refreshes. Empty lines are skipped. **Ctrl+S** saves committed entries to a new epoch-named `.log` in the current directory (status appears below the list). Exit with **Ctrl+C** or **Ctrl+D** (EOF).

To run it directly:

```bash
chmod +x timelog
cp timelog ~/.local/bin/timelog   # or /usr/local/bin/timelog
```

Make sure the destination directory is in your `PATH`.

## Requirements

- Bash

## License

[MIT](LICENSE)
