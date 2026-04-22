<div align="center">
    <img src="logo.svg" alt="" width="180" height="180" />
    <h1>timelog</h1>
    <p>Lap-timed terminal notes, line by line.</p>
</div>

## Usage

```bash
bash timelog
bash timelog --clock    # same as no args (wall-clock hour:minute:second per line)
bash timelog --lap      # delta since previous line (+HH:MM:SS), first line +00:00:00
bash timelog --total    # elapsed since first line (+HH:MM:SS), first line +00:00:00
# shorts: -c (clock), -l (lap), -t (total)
```

Type a line and press Enter. Each entry is recorded as `index  time  ::  text` and the screen refreshes. Empty lines are skipped. Exit with `Ctrl+D` (EOF).

To run it directly:

```bash
chmod +x timelog
cp timelog ~/.local/bin/timelog   # or /usr/local/bin/timelog
```

Make sure the destination directory is in your `PATH`.

**Clock mode (default):** the middle column is the system hour:minute:second when the line was committed.

**Lap mode:** the middle column is the elapsed time since the previous committed line (stopwatch lap style); the first line uses `+00:00:00`.

**Total mode:** the middle column is cumulative elapsed time since the first committed line; the first line uses `+00:00:00`.

## Requirements

- Bash

## License

[MIT](LICENSE)
