#!/usr/bin/env bash
#
# Assembles self-contained AI-PDS skill folders under dist/, one per runtime.
#
#   ./scripts/build-skill.sh          # both runtimes (default)
#   ./scripts/build-skill.sh claude   # Claude Desktop only (SKILL.md from claude-desktop/)
#   ./scripts/build-skill.sh quick    # Quick Desktop only  (SKILL.md from the repo root)
#
# Output layout — each runtime gets its own tree, so building one never
# clobbers the other and neither ever contains the repo's claude-desktop/ folder:
#
#   dist/claude/ai-pds/                    staged skill
#   dist/claude/ai-pds-claude-desktop.zip  upload this to Claude Desktop
#   dist/quick/ai-pds/                     staged skill
#   dist/quick/ai-pds-quick-desktop.zip    import this into Quick Desktop
#
# The repo itself is never modified — everything is copied into dist/.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_NAME="ai-pds"

# Only these paths are copied into a staged skill. Anything else in the repo
# (claude-desktop/, docs, dist/ itself) is deliberately left out.
PAYLOAD=(rules templates)

usage() {
  echo "usage: $(basename "$0") [claude|quick|both]" >&2
  exit 64
}

skill_src_for() {
  case "$1" in
    claude) echo "$REPO_ROOT/claude-desktop/SKILL.md" ;;
    quick) echo "$REPO_ROOT/SKILL.md" ;;
  esac
}

build_one() {
  local runtime="$1"
  local skill_src out_base out_dir
  skill_src="$(skill_src_for "$runtime")"
  out_base="$REPO_ROOT/dist/$runtime"
  out_dir="$out_base/$SKILL_NAME"

  if [[ ! -f "$skill_src" ]]; then
    echo "error: missing ${skill_src#"$REPO_ROOT"/}" >&2
    return 1
  fi

  rm -rf "$out_base"
  mkdir -p "$out_dir"

  cp "$skill_src" "$out_dir/SKILL.md"
  local item
  for item in "${PAYLOAD[@]}"; do
    cp -R "$REPO_ROOT/$item" "$out_dir/$item"
  done

  # Strip macOS metadata, and defensively drop any runtime-specific folder that
  # a future payload addition might drag in — the staged skill must hold exactly
  # one SKILL.md so the assistant cannot load the wrong orchestrator.
  find "$out_dir" -name '.DS_Store' -delete
  rm -rf "$out_dir/claude-desktop" "$out_dir/dist"

  local count
  count="$(find "$out_dir" -type f | wc -l | tr -d ' ')"

  echo "── $runtime ─────────────────────────────────────────────"
  echo "SKILL.md source: ${skill_src#"$REPO_ROOT"/}"
  echo "Staged at:       ${out_dir#"$REPO_ROOT"/}  ($count files)"
  echo
  find "$out_dir" -type f | sed "s|$REPO_ROOT/||" | sort
  echo

  # The folder inside the zip stays $SKILL_NAME (it must match the skill name);
  # only the archive itself is named per runtime.
  local zip_name="$SKILL_NAME-$runtime-desktop.zip"
  local zip_path="$out_base/$zip_name"
  rm -f "$zip_path"
  (cd "$out_base" && zip -qr "$zip_name" "$SKILL_NAME")
  echo "Zipped for upload: ${zip_path#"$REPO_ROOT"/}"
  if [[ "$runtime" == "claude" ]]; then
    echo "Next: Claude Desktop → Customize → Skills → Add → upload that zip."
  else
    echo "Next: Quick Desktop → Agents & skills → Skills → + Create → import that zip."
  fi
  echo
}

case "${1:-both}" in
  claude) RUNTIMES=(claude) ;;
  quick) RUNTIMES=(quick) ;;
  both | all) RUNTIMES=(claude quick) ;;
  *) usage ;;
esac

for runtime in "${RUNTIMES[@]}"; do
  build_one "$runtime"
done
