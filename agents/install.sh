#!/bin/bash
# Restore skills listed in ~/.agents/.skill-lock.json and Claude Code plugins on a new machine.
# Skips skills that are already installed, so it is safe to re-run.
set -euo pipefail

for c in jq npx claude; do
    command -v "$c" >/dev/null || { echo "agents/install.sh: $c not found; install it, then rerun this script" >&2; exit 1; }
done

jq -r '.skills | to_entries | group_by(.value.source)[] | "\(.[0].value.source) \(map(.key) | join(" "))"' ~/.agents/.skill-lock.json |
    while read -r src names; do
        missing=()
        for n in $names; do [ -e ~/.claude/skills/"$n" ] || missing+=("$n"); done
        if [ ${#missing[@]} -gt 0 ]; then
            npx -y skills add "$src" -g -y -a claude-code --skill "${missing[@]}" </dev/null || echo "failed: $src" >&2
        fi
    done

claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add DietrichGebert/ponytail
for p in ponytail@ponytail typescript-lsp@claude-plugins-official swift-lsp@claude-plugins-official rust-analyzer-lsp@claude-plugins-official; do
    claude plugin install "$p"
done
