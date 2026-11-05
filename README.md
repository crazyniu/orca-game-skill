# Orca game skills

Agent skills for making Unity games with AI agents coordinated by Orca. They work with Claude Code, Codex, Pi and other agents that read the standard `SKILL.md` format.

## Why

Generated mockups look good, but the game built from them rarely matches. A flat image is not a specification, and agents guess sizes, states and motion. These skills replace the guessing with a fixed order: agree on the look in writing, build a clickable UI the user can try in the Unity Editor, and connect game logic only after the user approves that UI.

## Skills

### ui-first-development

Unity game development flow: design first, UI second, logic last.

| Stage | Result | Gate |
| --- | --- | --- |
| 0. Core loop prototype (optional) | Throwaway build answering "is it fun?" | Proceed, pivot or kill |
| 1. Art direction | Visual identity, mood, shapes, colors, UI, motion and sound direction, asset standards; mockups as direction only | User approves the direction |
| 2. Screen spec | Per screen: player need, layout and sizes, every state, interactions, view contract, motion and sound, acceptance criteria; shared pattern library | Independent review and user approval |
| 3. Assets | Asset inventory, per-asset specs with generation prompts, manifest | User confirms the list |
| 4. UI shell | Real Unity scene and views with fake data, motion, sound and a development state switcher | Tests, screenshots of every state, timed animation evidence |
| 5. User approval | User tries every state in the Unity Editor | Approved captures become the visual baseline |
| 6. Logic wiring | Real logic through the same view contract, no visual changes | Tests pass, baseline still matches |
| 7. Device check | Touch feel, frame rate, memory, safe area, audio on real phones | Issues return to their stage |

It also includes:

- How existing projects join the flow and which stages a small change needs.
- A question-by-question script for running each stage with the user.
- Templates and filled examples: art direction, screen spec, pattern library, asset specs.
- Unity implementation standards and starting code compiled against Unity 6000.6: screen stack, view contract with a fake data source, development state switcher, motion switch, timed frame capture with a timing log, and Play Mode tests for state reachability and same-role control sizes.
- Evidence format and a timing checker that compares logs with the spec's durations.
- Worker brief and report templates for Orca dispatch.
- A list of common failures with the rule that prevents each.

Maintainers: `tools/compile_unity_templates.sh <unity-project>` compiles the C# templates with the Roslyn compiler bundled in Unity, without starting the Editor.

## Install

Send this to your agent:

```text
Install the Unity game development skills from https://github.com/crazyniu/orca-game-skill for all my coding agents by running `npx -y skills add crazyniu/orca-game-skill -g -a claude-code -a codex -a pi -y`, then run `npx -y skills list -g` and confirm that ui-first-development is installed.
```

Update later with `npx -y skills update -g`.
