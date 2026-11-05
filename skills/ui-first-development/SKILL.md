---
name: ui-first-development
description: >-
  Unity game development flow for any Unity game: design first, UI second,
  logic last. Use when planning, dispatching, building or reviewing art
  direction, screens, menus, HUDs, popups, buttons, animation or sound, and
  before connecting game logic to a screen. An art direction and per-screen
  specs are agreed with the user; the user approves a clickable, animated UI
  shell in the Unity Editor with fake data; only then is game logic
  connected.
---

# UI-first Unity game development

Generated or painted mockups often look good but cannot be reproduced pixel for pixel in Unity, so a flat image is never the acceptance target. Ambiguity is removed in writing first (art direction, screen specs, asset specs), the user approves what they can actually click in the Unity Editor, and game logic is connected only to UI the user has already approved.

The project's own rules (agent instructions, conventions, naming, test and build workflow) still apply and win on conflict. Where this skill names a path or tool, use the project's equivalent. Unity implementation standards for stages 4 to 7: [references/unity.md](references/unity.md).

"Logic last" means connecting logic to views waits for UI approval. Pure game logic (rules, economy, saves) and its tests may be developed at any time, kept independent of views.

## Files in this skill

Read a file when its stage starts; do not load everything up front.

| File | Read when |
| --- | --- |
| [references/collaboration.md](references/collaboration.md) | Running any stage with the user: which questions, in which order |
| [references/art-direction.md](references/art-direction.md) | Stage 1 |
| [references/screen-spec.md](references/screen-spec.md), [references/pattern-library.md](references/pattern-library.md) | Stage 2 |
| [references/examples.md](references/examples.md) | Writing any spec: filled screen spec, asset specs and pattern entry showing the expected depth |
| [references/asset-spec.md](references/asset-spec.md) | Stage 3 |
| [references/unity.md](references/unity.md), [assets/unity/](assets/unity/README.md) | Stages 4 to 7: standards and starting code (screen stack, view contract, fake data, state switcher, timed capture, consistency tests) |
| [references/evidence.md](references/evidence.md), [scripts/check_timing.py](scripts/check_timing.py) | Producing or checking screenshots, frame sequences and timing logs |
| [references/review-checklist.md](references/review-checklist.md) | Any review |
| [references/pitfalls.md](references/pitfalls.md) | Before every hand-over to the user, and when writing a brief |
| [references/dispatch.md](references/dispatch.md) | Writing a worker brief, reading a worker report |

## Documents and default locations

Use the project's locations when it has them; otherwise:

| Document | Default path | Scope |
| --- | --- | --- |
| Art direction | `docs/design/art-direction.md` | per game |
| Pattern library | `docs/design/patterns.md` | per game, created before the first screen spec |
| Screen spec | `docs/design/screens/<screen>.md` | per screen |
| Asset specs and manifest | `docs/design/assets.md` | per game |
| Visual baseline | `art/approved_runtime/<screen>/<state>.png` | per approved screen |

Keep every document as short as it can be while complete. Extra documents buy traceability, not a better game; write only what a builder or reviewer needs.

## Choosing the entry point

- **New game:** stage 0 or 1.
- **Existing game joining this flow:** inventory what exists. Already approved art becomes the art direction's evidence (write the document from it, do not regenerate art). For each existing screen, write its spec from the current build (stage 2), rebuild it as a UI shell where it does not meet the spec (stage 4), and take its baseline once the user approves (stage 5).
- **New screen or popup:** stage 2 onward.
- **Change to an approved screen:** update the screen spec section, then stages 4 and 5 for that screen only; the baseline is replaced after approval.
- **Logic-only change with no visible effect:** stage 6 checks only; the baseline must still match.

## Working method (all stages)

- **Section by section.** For every design document: context, questions, options with a recommendation, user decision, draft, user approval, write to file. Never generate a whole document and present it as finished.
- **Write each approved section to file immediately.** Unfinished sections stay marked `[To be designed]`, so work resumes from the file after any interruption.
- **Show where every decision comes from:** the art direction, an earlier spec, or a user choice.
- **Surface conflicts, never resolve them silently.** When art direction conflicts with readability, a technical budget or an earlier approved document, present both positions and the trade-off and let the user decide.
- **A missing standard is not a pass.** If a check has no criterion (no accessibility target, no performance budget, no device), report it as `NOT ASSESSED` with the missing input, never as passed.
- **Independent review.** Reviews of a spec or a build run in a fresh context (another agent or session), not in the session that wrote it, so the reviewer does not inherit the author's assumptions.
- **Reuse before inventing.** Every control uses an entry from the pattern library; a new pattern is added to the library before the work counts as done.

## Stages

Run the stages in order. Do not start a stage before the previous gate is passed. Stage 0 and 1 are per game (revisited when direction changes); stages 2 to 7 are per screen.

### 0. Core loop prototype (optional, per mechanic)

- Answers one question: is this mechanic fun? Throwaway, capped at about a day, no polish, kept apart from production code and never refactored into it.
- This is the only throwaway build in the flow. UI is never prototyped this way; see stage 4.
- Gate: the user decides proceed, pivot or kill. After three pivots on the same idea, force a kill-or-continue decision.

### 1. Art direction

Write the art direction document with [references/art-direction.md](references/art-direction.md): visual identity rule, mood per game state, shape language, color system, character and environment direction, UI visual direction, motion and sound direction, asset standards, reference direction.

- Then produce full-screen mockups at the target aspect ratio as proof of the direction.
- Gate: the user approves the document and the mockups as direction.
- A mockup is never diffed against runtime and never treated as exact layout. When a mockup and the written direction disagree, the written direction wins until the user decides otherwise.

### 2. Screen spec

Write one spec per screen with [references/screen-spec.md](references/screen-spec.md): player need, entry and exit, layout zones and component inventory with sizes, complete state list, interaction map, view contract, animation and sound per interaction, accessibility, text limits, testable acceptance criteria.

- Keep the pattern library ([references/pattern-library.md](references/pattern-library.md)) current; the spec references its patterns instead of re-specifying them.
- Gate: an independent review against [references/review-checklist.md](references/review-checklist.md) returns APPROVED, and the user approves the spec. The user may knowingly accept a NEEDS REVISION risk; record that override.

### 3. Assets

Follow [references/asset-spec.md](references/asset-spec.md).

- Derive the asset inventory from the approved screen spec and show it to the user before any production. Gate: the user confirms the list.
- Write a spec for every asset: purpose, final size, format, name, states or frames, visual description precise enough that two artists would produce the same thing, governing art direction rules, generation prompt with negatives.
- Produce every element as its own engine-ready asset at its final size. Derived assets are new files; never overwrite source or approved originals.
- Track every asset in a manifest with status: needed, in progress, delivered, approved.
- Stage 4 may start with placeholders at the exact final size while assets are produced; the user reviews only with final assets in place.

### 4. UI shell

- Build in the real scene, views and prefabs the shipped game will use, following [references/unity.md](references/unity.md). Never a separate demo scene, sandbox copy or prototype in another technology, because it would need rewriting and would drift from the game.
- Start from the templates in [assets/unity/](assets/unity/README.md), or adapt the project's existing equivalents to the same contract.
- Feed the views from a fake data source that implements the view contract. No game rules in this stage; the UI never owns or decides game state, it shows data and raises events.
- Include real input feedback, transitions, idle motion, music and sound, following the pattern library's animation and sound tables.
- Add a development-only state switcher (editor window or `UNITY_EDITOR` / `DEVELOPMENT_BUILD` overlay) so the user can step through every state in Play mode. It is excluded from release builds.
- Before delivery the implementer verifies: compile, Edit Mode and Play Mode suites, a screenshot of every state at the smallest and largest supported resolution, and timed evidence (frames captured at a fixed `Time.captureFramerate` plus timing logs) for animation and sound. One still frame never proves motion or audio.

### 5. User approval

- Tell the user which branch or build to open and which states to check. The default is the Unity Editor in Play mode, with the Game view at the target device resolution or the Device Simulator. A WebGL or device build is only for reviewing away from the Editor or for sharing.
- Before handing over, check the delivery against [references/pitfalls.md](references/pitfalls.md) and look at every piece of evidence yourself.
- Never declare a UI done yourself. Track every defect the user reports and fix it in the shell.
- Gate: the user explicitly approves the screen. Then commit runtime captures of every state as the visual baseline in the project's baseline location.

### 6. Logic wiring

- Replace the fake data source with the real game logic through the same view contract.
- Layout, art, animation and sound do not change in this stage. Any visual change goes back to stage 5 for approval.
- Verify: tests pass and new captures still match the approved baseline.

### 7. Device check and polish

- Install a development build on real target devices for touch feel, frame rate, memory, safe areas and audio behavior; profile with the Unity Profiler before optimizing.
- Animations can be skipped where the spec says so and respect reduced-motion settings; sounds go through the project's audio service and Audio Mixer groups and follow the mute and volume settings.
- Problems go back to the stage that owns them.

## Dispatch checklist

Dispatch through the Orca orchestration skill. Unity work runs on a machine with the project's Unity version, one Unity process at a time. Use the brief and report templates in [references/dispatch.md](references/dispatch.md). When handing any stage to a worker, the task spec states:

- The stage, the screen, and the gate it must reach.
- The owned files and the documents it must follow (art direction, screen spec, asset specs, pattern library).
- The required evidence: a screenshot per state; timed frames and logs for motion and sound; review verdicts.
- What the worker must not touch: game rules and content in stages 1 to 5; layout, art, animation and sound in stage 6.
