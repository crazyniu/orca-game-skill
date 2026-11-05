# Evidence format

Evidence is what lets the coordinator and the user check a delivery without rerunning it. Generated evidence goes to an ignored build folder; only the approved baseline and evidence a task explicitly requires are committed.

## Layout

```
build/evidence/<screen>/
  states/<resolution>/<state>.png          one still per state per resolution
  motion/<interaction>/frame_0000.png ...  frame sequence at a fixed frame rate
  motion/<interaction>/timing.jsonl        UiTiming log of the same run
  motion/<interaction>/timing-check.txt    output of check_timing.py
  motion/<interaction>/contact.png         contact sheet, optional
  tests.txt                                test commands and counts
```

Names: lowercase, hyphens for spaces, state names exactly as in the screen spec (`zero-coins.png`, `booster-at-maximum.png`). Resolutions as `1080x1920`.

## Stills

- Taken with instant motion, after the state is applied and one frame has rendered.
- Every state of the screen spec, at the smallest and the largest supported resolution.
- A still proves layout, sizes and layering only. It never proves motion, timing or sound.

## Timed capture

- Fixed rate (30 fps unless the spec needs more), real motion, started before the trigger and stopped after the last animation settles.
- The timing log has one JSON object per line: `{"t":1.2667,"frame":38,"name":"shop_open","phase":"end"}`. Phases are `start`, `end` and `sound`.
- Every animation in the screen spec's motion table has a `start` and an `end`; every sound has a `sound` mark at the moment it starts.
- `expected.json` holds the spec's durations as ranges, for example `{"shop_open": [0.22, 0.28]}`. `check_timing.py` must print no FAIL, MISSING or OPEN lines.
- For idle motion (breathing, random idle actions) capture at least ten seconds and report how often each action occurred and the longest still period.

## Contact sheets

For review in chat or on a pull request, combine frames into one image: every second or third frame of a sequence, or all states of a screen, labelled with the frame number or state name.

## Baseline

After the user approves a screen, copy `states/` to the project's baseline location (default `art/approved_runtime/<screen>/<state>.png`). Later captures of the same state are compared with it; a visible difference is either a regression to fix or a change the user approves again.
