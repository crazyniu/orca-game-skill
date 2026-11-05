# Pattern library

One document per game, created before the first screen spec and updated whenever a new pattern appears. Screens reference patterns; they do not re-specify them.

## Required patterns

Cover at least those the game uses: primary, secondary and icon buttons; toggle; slider; list and grid; tabs; scroll area; modal and dialog; toast; tooltip; progress bar; currency counter; badge; reward reveal; screen transition.

## For each pattern

- When to use, and when not to.
- Sizes: fixed sizes per role. Buttons of the same role share one size in every state; disabled is dimmed and non-interactive, not smaller. State the ratio a primary action may have against its siblings.
- Every state: normal, pressed, disabled, selected, focused, and any game-specific ones, with how each looks.
- Motion and sound: reference rows in the tables below.
- Accessibility notes and implementation notes for Unity (component setup, prefab structure).

## Animation standards table

Columns: name, used by, duration, easing, overshoot, skippable, reduced-motion fallback.

## Sound standards table

Columns: name, used by, sound asset, trigger moment, volume group, behavior when muted.

## Consistency

No two patterns may behave differently for the same intent (for example back and close behave the same everywhere).
