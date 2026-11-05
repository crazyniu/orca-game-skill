# Asset inventory and specs

## Inventory

From the approved screen spec, list every asset it needs, explicit and implied, grouped by category:

- 2D art: backgrounds, panels, buttons, icons, badges.
- Characters: stills and every animation frame sequence or rig.
- Effects: particles, glows, transitions.
- Audio: music per state, UI sounds, gameplay sounds (described by sonic character, not prompts).
- Fonts, if custom.

Reuse an existing asset whenever the pattern library already provides it. Show the grouped list to the user; produce nothing before the user confirms it.

## Spec per asset

Use descriptive asset names that follow the project's naming rules, not running numbers.

| Field | Value |
| --- | --- |
| Name | final file name |
| Category | 2D art, character, effect, audio, font |
| Used by | screens and patterns |
| Final size | exact pixels, or frame size and frame count; duration for audio |
| Format | PNG with alpha, sprite sheet, WAV, and so on |
| States or frames | every state or frame the asset needs |
| Text | baked text and its maximum length, if any |

Then:

- **Visual description:** two or three sentences, precise enough that two artists would produce the same thing.
- **Art direction anchors:** the sections of the art direction document this asset follows.
- **Generation prompt:** style keywords, composition, palette anchors, lighting, and negatives. Name the approved mockup or asset to use as a style reference. For audio, describe the sound instead.

If art direction and a technical budget disagree for an asset, present both and let the user choose.

## Manifest

One table for the whole game: asset name, used by, status (needed, in progress, delivered, approved), file path. Update it whenever an asset changes status. Edit specs in place when re-running for the same screen; never replace existing entries wholesale.
