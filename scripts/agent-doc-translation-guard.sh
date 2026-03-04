#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BASELINE_FILE=".github/agent-doc-translation-baseline.md"
MARKER_RE='Translation In Progress|Translation in progress|内容同步中|内容翻译同步中'

if [[ ! -f "$BASELINE_FILE" ]]; then
  echo "ERROR: missing baseline file: $BASELINE_FILE"
  exit 1
fi

current_hits_tmp="$(mktemp)"
current_docs_tmp="$(mktemp)"
current_i18n_tmp="$(mktemp)"
baseline_docs_tmp="$(mktemp)"
baseline_i18n_tmp="$(mktemp)"
new_docs_tmp="$(mktemp)"
new_i18n_tmp="$(mktemp)"
trap 'rm -f "$current_hits_tmp" "$current_docs_tmp" "$current_i18n_tmp" "$baseline_docs_tmp" "$baseline_i18n_tmp" "$new_docs_tmp" "$new_i18n_tmp"' EXIT

rg -n "$MARKER_RE" docs i18n/en/docusaurus-plugin-content-docs/current 2>/dev/null \
  | sed -E 's/:.*$//' \
  | sort -u >"$current_hits_tmp" || true

grep -E '^docs/' "$current_hits_tmp" >"$current_docs_tmp" || true
grep -E '^i18n/en/docusaurus-plugin-content-docs/current/' "$current_hits_tmp" >"$current_i18n_tmp" || true

awk '
  /^## docs_placeholders$/ {in_block=1; next}
  /^## i18n_placeholders$/ {in_block=0}
  in_block && /^- / {
    gsub(/^- /, "", $0)
    gsub(/`/, "", $0)
    print $0
  }
' "$BASELINE_FILE" | sort >"$baseline_docs_tmp"

awk '
  /^## i18n_placeholders$/ {in_block=1; next}
  /^## Update Method$/ {in_block=0}
  in_block && /^- / {
    gsub(/^- /, "", $0)
    gsub(/`/, "", $0)
    print $0
  }
' "$BASELINE_FILE" | sort >"$baseline_i18n_tmp"

comm -13 "$baseline_docs_tmp" "$current_docs_tmp" >"$new_docs_tmp"
comm -13 "$baseline_i18n_tmp" "$current_i18n_tmp" >"$new_i18n_tmp"

new_docs_count="$(wc -l <"$new_docs_tmp" | awk '{print $1}')"
new_i18n_count="$(wc -l <"$new_i18n_tmp" | awk '{print $1}')"

if [[ "$new_docs_count" -gt 0 || "$new_i18n_count" -gt 0 ]]; then
  echo "ERROR: new translation placeholders detected against baseline."
  if [[ "$new_docs_count" -gt 0 ]]; then
    echo
    echo "[new_docs_placeholders]"
    cat "$new_docs_tmp"
  fi
  if [[ "$new_i18n_count" -gt 0 ]]; then
    echo
    echo "[new_i18n_placeholders]"
    cat "$new_i18n_tmp"
  fi
  echo
  echo "If intentional, update $BASELINE_FILE in the same PR."
  exit 1
fi

echo "agent-doc-translation-guard passed."
