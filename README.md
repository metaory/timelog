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
  <img src=".github/demos/clock.gif" alt="timelog clock mode demo" width="60%" />

  <p><strong>Lap (--lap)</strong></p>
  <img src=".github/demos/lap.gif" alt="timelog lap mode demo" width="60%" />

  <p><strong>Total (--total)</strong></p>
  <img src=".github/demos/total.gif" alt="timelog total mode demo" width="60%" />
</div>

## Usage

```bash
bash timelog
bash timelog --clock    # same as no args (wall-clock hour:minute:second per line)
bash timelog --lap      # delta since previous line (+HH:MM:SS), first line +00:00:00
bash timelog --total    # elapsed since first line (+HH:MM:SS), first line +00:00:00
# shorts: -c (clock), -l (lap), -t (total)
```

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
