# Orca game skills

Agent skills for Unity game development with Orca. Each folder with a `SKILL.md` is one skill, usable by Claude Code, Codex, omp and pi.

## Skills

| Skill | Use |
| --- | --- |
| [ui-first-development](ui-first-development/SKILL.md) | Unity game development flow: art direction, screen specs and assets first; a clickable, animated UI shell with fake data approved by the user in the Unity Editor; game logic connected last. |

### ui-first-development

Stages, each with a gate before the next:

0. Core loop prototype (optional, throwaway): is the mechanic fun?
1. Art direction document and mockups as style direction ([template](ui-first-development/references/art-direction.md)).
2. Screen spec per screen with an independent review ([template](ui-first-development/references/screen-spec.md), [pattern library](ui-first-development/references/pattern-library.md), [review checklist](ui-first-development/references/review-checklist.md)).
3. Asset inventory, per-asset specs and manifest ([template](ui-first-development/references/asset-spec.md)).
4. UI shell in the real Unity scene with fake data, motion, sound and a development state switcher ([Unity standards](ui-first-development/references/unity.md)).
5. User approval in the Unity Editor; approved captures become the visual baseline.
6. Logic wiring through the same view contract, without visual changes.
7. Device check and polish.

Mockups are style direction only; the acceptance target is what the user approved in Unity.

## Install

```bash
git clone https://github.com/crazyniu/orca-game-skill.git ~/.agents/orca-game-skill
bash ~/.agents/orca-game-skill/install.sh
```

The script links each skill into `~/.agents/skills` and, when Claude Code is installed, `~/.claude/skills`. An existing non-link folder of the same name is first moved to `~/.agents/skill-backups/`.

## Update

```bash
git -C ~/.agents/orca-game-skill pull
```

Links pick up the change immediately. Run `install.sh` again only when a new skill folder is added.
