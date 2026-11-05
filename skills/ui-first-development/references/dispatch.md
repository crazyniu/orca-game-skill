# Worker briefs and reports

Workers are dispatched through the Orca orchestration skill; load it for the exact commands and for placing a worker on a paired machine. This file defines what goes into the brief and what must come back.

## Placement

- Unity compile, tests, screenshots and timed capture run on a machine with the project's Unity version. One Unity batch process at a time per machine (use the project's lock if it has one). Never run batch mode on a project the user has open in the Editor.
- Image generation, documents and pure logic can run anywhere.
- Each worker gets its own branch and workspace; workers never change the user's primary checkout and never merge.

## Brief template

```markdown
# <task title in plain words>

Skill: ui-first-development, stage <n> (<stage name>), screen <screen>.
Gate to reach: <the stage gate, in one sentence>.

## Inputs
- Art direction: <path and sections>
- Screen spec: <path> (approved <date>)
- Pattern library: <path>
- Asset specs / manifest: <path>
- Baseline (stage 6 only): <path>

## Owned files
<exact paths or folders the worker may change; everything else is read-only>

## Do
<numbered steps specific to this task>

## Do not
- Stages 1 to 5: no game rules, levels, economy or save changes.
- Stage 6: no layout, art, motion or sound changes.
- No new scenes, copies of views, or version-named files.
<task-specific limits>

## Evidence to return
- Screenshots of every state at <smallest> and <largest> resolution: <folder>
- Timed capture for <animations>: frames, timing.jsonl, check_timing.py output
- Test commands and counts (passed, failed, skipped)
- Review verdict (stage 2)

## Report
Write <report path> using the report template. Return questions instead of guessing.
```

## Report template

```markdown
# <task title> report

Stage and gate: <stage>, <reached / not reached>.
Branch and commit: <branch> <commit>.

## Changed
<files and one line each on what changed>

## Verified
| Check | Command | Result |
| --- | --- | --- |
| Compile | <command> | <ok / errors> |
| Edit Mode tests | <command> | <passed / failed / skipped> |
| Play Mode tests | <command> | <passed / failed / skipped> |
| Screenshots | <command> | <folder, count> |
| Timing | check_timing.py <log> <expected> | <pass / fail lines> |

## Evidence
<links to every screenshot folder, frame sequence and log>

## Not done or not assessed
<anything skipped, with the reason and the missing input>

## Questions for the coordinator
<decisions that need the user>
```

## Coordinator review of a delivery

- Open the evidence yourself: look at every state screenshot and step through the frame sequences. A report is not evidence.
- Compare against the screen spec table by table: sizes, states, motion durations, sounds.
- Run the review checklist for the stage in a fresh context.
- Only then hand the build to the user; never forward a delivery unchecked.
