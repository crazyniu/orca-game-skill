# Common failures

Failures seen in real projects, with the rule that prevents each. Check a delivery against this list before handing it to the user.

## Process

| Failure | Prevention |
| --- | --- |
| Beautiful mockups, a game that looks nothing like them | Mockups are direction only; the user approves the Unity build. Write sizes, states and motion into specs before building. |
| Agent guesses layout from a flat image | Every size comes from the screen spec's component table or measured from an approved asset. |
| Art style drifts between generation rounds | One written art direction; every prompt names the approved master image as style reference; rejected directions and their reasons are recorded. |
| UI declared done by the agent | Only the user approves; the agent hands over a checklist and evidence. |
| A report claims tests passed from an earlier run | Every delivery reruns tests and lists commands and counts from this run. |
| A static screenshot offered as proof of animation | Motion needs a frame sequence and a timing log. |
| A second scene, copied view or "new" folder to try a redesign | Edit the real views in place on a branch; history lives in Git. |
| Files and classes named after versions or task numbers | Name by meaning; the project's naming check runs before every test. |
| Workers edit the user's open project or primary checkout | Each worker uses its own workspace; batch mode never touches a project open in the Editor. |

## Layout and art

| Failure | Prevention |
| --- | --- |
| Buttons of one role have different sizes; disabled buttons shrink | Fixed sizes per role in the pattern library; disabled is dimmed and inert; the size consistency test runs in every state. |
| Primary button dwarfs its siblings | Pattern library caps the ratio (for example 1.25 times). |
| Icons look tiny or uneven although the images have the same size | Size glyphs by their opaque bounds, not the canvas; trim transparent padding consistently. |
| Text overflows panels, ribbons or counters | Text limits per element in the spec; test with the maximum values (99999, longest name). |
| Popup behind board pieces, characters or map objects | One layer order for the whole game; dim layer and panel above every world object; a still of each popup over the busiest screen. |
| Controls hidden under top or bottom bars or the notch | Safe-area root; scroll viewports end at the bars; check at the smallest and tallest resolution. |
| Stretched or squashed art | Keep native proportions; 9-slice only where the asset spec defines borders. |
| Halo or haze around cut-out sprites | Clean alpha edges at export; check sprites over both light and dark backgrounds. |
| Controls shown that cannot be used (undo with nothing to undo) | Every control has a defined state per screen state; hide or disable it as the spec says. |
| Screen looks different from the approved mockup in color | Color values come from the art direction palette; compare against the baseline, not by memory. |

## Motion

| Failure | Prevention |
| --- | --- |
| An action faked by mirroring, scaling or shaking one still image | Actions are drawn frame sequences; transforms only for breathing, squash and UI feedback. |
| Characters look frozen | Continuous breathing plus frequent idle actions; capture ten seconds and report the longest still period. |
| Characters turn semi-transparent during pose changes | Crossfades between frames keep the character fully opaque (swap frames, or fade the new frame in over the old one). |
| Ghost or doubled frames in a sequence | Every frame on the same canvas and pivot; no leftover pixels from neighbouring frames; step through the sequence frame by frame. |
| Entrance too fast or too slow | Duration ranges in the spec; check_timing.py against the log. |
| Elements pop in from random positions | Start positions are deterministic and specified (off-screen side, offset). |
| Tweens keep running after a popup closes, or fire on destroyed objects | Every tween and coroutine is stopped when its owner hides or is destroyed. |
| Instant-motion mode hides a broken animation | Stills use instant motion; every animation also gets a timed capture with real motion. |

## Sound

| Failure | Prevention |
| --- | --- |
| A page has no background music | Music is set per screen and started from the screen stack; every screen in the spec lists its music. |
| New sounds ignore the mute switch | All sounds go through the audio service and mixer groups that the mute and volume settings control. |
| Sound and animation out of sync | Sound marks in the timing log next to the animation marks; compare the moments. |
