#!/usr/bin/env bash
# Links every skill in this repository into the shared agent skill directory
# (~/.agents/skills, read by Codex, omp and pi) and into ~/.claude/skills when
# Claude Code is present. Links, not copies, so `git pull` updates every agent.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
targets=("$HOME/.agents/skills")
[ -d "$HOME/.claude" ] && targets+=("$HOME/.claude/skills")

for skill_dir in "$repo"/*/; do
  [ -f "$skill_dir/SKILL.md" ] || continue
  name="$(basename "$skill_dir")"
  for target in "${targets[@]}"; do
    mkdir -p "$target"
    link="$target/$name"
    if [ -e "$link" ] && [ ! -L "$link" ]; then
      # Back up outside the skill directory so the copy is not loaded as a second skill.
      backup_dir="$HOME/.agents/skill-backups"
      mkdir -p "$backup_dir"
      backup="$backup_dir/$name-$(date +%Y%m%d%H%M%S)"
      mv "$link" "$backup"
      echo "moved existing $link to $backup"
    fi
    ln -sfn "${skill_dir%/}" "$link"
    echo "linked $link -> ${skill_dir%/}"
  done
done
