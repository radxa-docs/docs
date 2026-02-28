#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DOC_ROOT="docs"
I18N_ROOT="i18n/en/docusaurus-plugin-content-docs/current"
MARKER_RE='Translation In Progress|Translation in progress|内容同步中|内容翻译同步中'

hits_tmp="$(mktemp)"
docs_tmp="$(mktemp)"
i18n_tmp="$(mktemp)"
trap 'rm -f "$hits_tmp" "$docs_tmp" "$i18n_tmp"' EXIT

rg -n "$MARKER_RE" "$DOC_ROOT" "$I18N_ROOT" 2>/dev/null \
  | sed -E 's/:.*$//' \
  | sort -u >"$hits_tmp" || true

grep -E '^docs/' "$hits_tmp" >"$docs_tmp" || true
grep -E '^i18n/en/docusaurus-plugin-content-docs/current/' "$hits_tmp" >"$i18n_tmp" || true

docs_count="$(wc -l <"$docs_tmp" | awk '{print $1}')"
i18n_count="$(wc -l <"$i18n_tmp" | awk '{print $1}')"
total_count=$((docs_count + i18n_count))

echo "docs_placeholder_count ${docs_count}"
echo "i18n_placeholder_count ${i18n_count}"
echo "total_placeholder_count ${total_count}"
echo
echo "[docs_placeholders]"
cat "$docs_tmp"
echo
echo "[i18n_placeholders]"
cat "$i18n_tmp"
