#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BASELINE_FILE=".github/agent-doc-drift-baseline.md"

if [[ ! -f "$BASELINE_FILE" ]]; then
  echo "ERROR: missing baseline file: $BASELINE_FILE"
  exit 1
fi

docs_tmp="$(mktemp)"
i18n_tmp="$(mktemp)"
current_docs_only_tmp="$(mktemp)"
current_i18n_only_tmp="$(mktemp)"
baseline_docs_only_tmp="$(mktemp)"
baseline_i18n_only_tmp="$(mktemp)"
new_docs_only_tmp="$(mktemp)"
new_i18n_only_tmp="$(mktemp)"
trap 'rm -f "$docs_tmp" "$i18n_tmp" "$current_docs_only_tmp" "$current_i18n_only_tmp" "$baseline_docs_only_tmp" "$baseline_i18n_only_tmp" "$new_docs_only_tmp" "$new_i18n_only_tmp"' EXIT

(
  cd docs
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) >"$docs_tmp"

(
  cd i18n/en/docusaurus-plugin-content-docs/current
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) >"$i18n_tmp"

comm -23 "$docs_tmp" "$i18n_tmp" >"$current_docs_only_tmp"
comm -13 "$docs_tmp" "$i18n_tmp" >"$current_i18n_only_tmp"

awk '
  /^## docs_only$/ {in_block=1; next}
  /^## i18n_only$/ {in_block=0}
  in_block && /^- / {
    gsub(/^- /, "", $0)
    gsub(/`/, "", $0)
    print $0
  }
' "$BASELINE_FILE" | sort >"$baseline_docs_only_tmp"

awk '
  /^## i18n_only$/ {in_block=1; next}
  /^## Update Method$/ {in_block=0}
  in_block && /^- / {
    gsub(/^- /, "", $0)
    gsub(/`/, "", $0)
    print $0
  }
' "$BASELINE_FILE" | sort >"$baseline_i18n_only_tmp"

comm -13 "$baseline_docs_only_tmp" "$current_docs_only_tmp" >"$new_docs_only_tmp"
comm -13 "$baseline_i18n_only_tmp" "$current_i18n_only_tmp" >"$new_i18n_only_tmp"

new_docs_count="$(wc -l <"$new_docs_only_tmp" | awk '{print $1}')"
new_i18n_count="$(wc -l <"$new_i18n_only_tmp" | awk '{print $1}')"

if [[ "$new_docs_count" -gt 0 || "$new_i18n_count" -gt 0 ]]; then
  echo "ERROR: new docs/i18n drift detected against baseline."
  if [[ "$new_docs_count" -gt 0 ]]; then
    echo
    echo "[new_docs_only]"
    cat "$new_docs_only_tmp"
  fi
  if [[ "$new_i18n_count" -gt 0 ]]; then
    echo
    echo "[new_i18n_only]"
    cat "$new_i18n_only_tmp"
  fi
  echo
  echo "If this drift is intentional, update $BASELINE_FILE in the same PR."
  exit 1
fi

echo "agent-doc-drift-guard passed."
